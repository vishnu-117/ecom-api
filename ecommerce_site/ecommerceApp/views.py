from django.shortcuts import render
from rest_framework import viewsets
from rest_framework import generics, mixins, status
from rest_framework.pagination import CursorPagination
from rest_framework.response import Response
from .models import Orders, Products, Stocks
from .serializers import OrdersSerializers, ProductsSerializers, OrdersDetailSerializers


class GetOrdersDetailByStore(mixins.ListModelMixin, generics.GenericAPIView):
    queryset = Orders.objects.all()
    serializer_class = OrdersDetailSerializers
    pagination_class = CursorPagination
    page_size = 1
    ordering = 'order_id'

    def get_queryset(self):
        store_name = self.request.query_params.get('store_name').split(',')
        queryset = self.queryset.filter(store_id__store_name__in=store_name)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class GetProductDetailsByCategory(mixins.ListModelMixin, generics.GenericAPIView):
    queryset = Products.objects.all()
    serializer_class = ProductsSerializers
    pagination_class = CursorPagination
    page_size = 1
    ordering = 'product_name'

    def get_queryset(self):
        category_name = self.request.query_params.get('category_name')
        store_name = self.request.query_params.get('store_name')
        stock_id_list = Stocks.objects.filter(product_id__category_id__category_name=category_name, store_id__store_name=store_name).values_list('product_id', flat=True)
        queryset = self.queryset.filter(product_id__in=stock_id_list)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class OrdersViewSet(viewsets.ModelViewSet):
    queryset = Orders.objects.all()
    serializer_class = OrdersSerializers
    pagination_class = CursorPagination
    page_size = 1
    ordering = 'order_id'

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def perform_create(self, serializer):
        serializer.save()

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)

    def perform_update(self, serializer):
        serializer.save()
    
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)

    def perform_destroy(self, instance):
        instance.delete()

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)
