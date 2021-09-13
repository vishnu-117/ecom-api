from rest_framework import serializers
from .models import Orders, Customers, Store, Staffs, Products, Stocks, OrderItems


class CustomersSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Customers
        exclude = ()

class StoreSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Store
        exclude = ()

class ProductsSerializers(serializers.ModelSerializer):
    stor_id = serializers.SerializerMethodField()
    stor_name = serializers.SerializerMethodField()
    city = serializers.SerializerMethodField()
    state = serializers.SerializerMethodField()
    brand_name = serializers.SerializerMethodField()
    quantity = serializers.SerializerMethodField()
    category_name = serializers.SerializerMethodField()

    class Meta:
        model = Products
        exclude = ()

    def stock(self, instance):
        instance = Stocks.objects.select_related('store_id').get(product_id=instance.product_id)
        return instance

    def get_stor_id(self, instance):
        stor_id = self.stock(instance).store_id.store_id
        return stor_id

    def get_stor_name(self, instance):
        stor_name = self.stock(instance).store_id.store_name
        return stor_name

    def get_city(self, instance):
        stor_name = self.stock(instance).store_id.city
        return stor_name

    def get_state(self, instance):
        stor_name = self.stock(instance).store_id.state
        return stor_name

    def get_brand_name(self, instance):
        brand_name = instance.brand_id.brand_name
        return brand_name

    def get_quantity(self, instance):
        quantity = self.stock(instance).quantity
        return quantity

    def get_category_name(self, instance):
        category_name = instance.category_id.category_name
        return category_name


class StaffsSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Staffs
        exclude = ()


class OrdersDetailSerializers(serializers.ModelSerializer):
    customer_name = serializers.SerializerMethodField()
    customer_city = serializers.SerializerMethodField()
    customer_state = serializers.SerializerMethodField()
    customer_email = serializers.SerializerMethodField()
    store_city = serializers.SerializerMethodField()
    store_state = serializers.SerializerMethodField()
    line_items = serializers.SerializerMethodField()
    
    class Meta:
        model = Orders
        exclude = ()

    def get_customer_name(self, instance):
        customer_instance = instance.customer_id
        customer_name = customer_instance.first_name+' '+customer_instance.last_name
        return customer_name

    def get_customer_city(self, instance):
        customer_instance = instance.customer_id
        customer_city = customer_instance.city
        return customer_city

    def get_customer_state(self, instance):
        customer_instance = instance.customer_id
        customer_state = customer_instance.state
        return customer_state

    def get_customer_email(self, instance):
        customer_instance = instance.customer_id
        customer_email = customer_instance.email
        return customer_email

    def get_store_city(self, instance):
        store_instance = instance.store_id
        store_city = store_instance.city
        return store_city

    def get_store_state(self, instance):
        store_instance = instance.store_id
        store_state = store_instance.state
        return store_state

    def get_line_items(self, instance):
        data = dict()
        orderitem_instance = OrderItems.objects.select_related('product_id').get(order_id=instance.order_id)
        data['item_id'] = orderitem_instance.item_id
        data['product_id'] = orderitem_instance.product_id.product_id
        data['product_name'] = orderitem_instance.product_id.product_name
        data['brand_id'] = orderitem_instance.product_id.brand_id.brand_id
        data['list_price'] = orderitem_instance.product_id.list_price
        data['discount'] = orderitem_instance.discount
        data['quantity'] = orderitem_instance.quantity
        data['final_price'] = data['list_price'] - data['discount']
        return data


class OrdersSerializers(serializers.ModelSerializer):

    class Meta:
        model = Orders
        exclude = ()
        # depth = 1
