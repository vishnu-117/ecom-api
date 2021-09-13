from django.conf import settings
from django.conf.urls import url
from rest_framework import routers
from .views import OrdersViewSet, GetProductDetailsByCategory, GetOrdersDetailByStore
from django.urls import path

router = routers.DefaultRouter()
router.register('order', OrdersViewSet, basename='order')

test_get_order = OrdersViewSet.as_view({
    'get': 'list',
})

test_post_order = OrdersViewSet.as_view({
    'post': 'create',
})

test_delete_order = OrdersViewSet.as_view({
    'delete': 'destroy',
})
urlpatterns = [
    path('get_orders_details_by_store/', GetOrdersDetailByStore.as_view(), name='get_orders_details_by_store'),
    path('get_product_details_by_category/', GetProductDetailsByCategory.as_view(), name='get_product_details_by_category'),
    path('test_get_order/', test_get_order, name='test_get_order'),
    path('test_post_order/', test_post_order, name='test_post_order'),
    path('test_delete_order/<int:pk>/', test_delete_order, name='test_delete_order'),
] + router.urls
