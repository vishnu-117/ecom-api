from django.db import models
from .choice import *

class Customers(models.Model):
    customer_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    phone = models.CharField(max_length=15)
    email = models.CharField(max_length=255)
    street = models.CharField(max_length=255)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    zip_code = models.CharField(max_length=10)


class Orders(models.Model):
    order_id = models.AutoField(primary_key=True)
    order_status = models.CharField(max_length=15, choices=status)
    order_date = models.DateTimeField()
    required_date = models.DateTimeField()
    shipped_date = models.DateTimeField()
    customer_id = models.ForeignKey('Customers', on_delete=models.CASCADE)
    store_id = models.ForeignKey('Store', on_delete=models.CASCADE)
    staff_id = models.ForeignKey('Staffs', on_delete=models.CASCADE)

    def __str__(self):
        return f"<Orders {self.order_id}>"


class Store(models.Model):
    store_id = models.AutoField(primary_key=True)
    store_name = models.CharField(max_length=255)
    phone = models.CharField(max_length=15)
    email = models.CharField(max_length=255)
    street = models.CharField(max_length=255)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    zip_code = models.CharField(max_length=10)

    def __str__(self):
        return f"<Store {self.store_id}  {self.store_name}>"


class Staffs(models.Model):
    staff_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)
    active = models.CharField(max_length=255)
    store_id = models.ForeignKey('Store', on_delete=models.CASCADE)
    manager_id = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return f"<Staffs {self.staff_id}  {self.first_name}>"


class Categories(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=255)

    def __str__(self):
        return f"<Categories {self.category_id}  {self.category_name}>"


class Products(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=255)
    model_year =  models.IntegerField()
    list_price =  models.FloatField()
    brand_id = models.ForeignKey('Brands', on_delete=models.CASCADE)
    category_id = models.ForeignKey('Categories', on_delete=models.CASCADE)

    def __str__(self):
        return f"<Products {self.product_id}  {self.product_name}>"


class Brands(models.Model):
    brand_id = models.AutoField(primary_key=True)
    brand_name = models.CharField(max_length=255)

    def __str__(self):
        return f"<Brands {self.brand_id}  {self.brand_name}>"


class OrderItems(models.Model):
    item_id = models.IntegerField()
    quantity = models.IntegerField()
    list_price = models.FloatField()
    discount = models.FloatField()
    order_id = models.ForeignKey('Orders', on_delete=models.CASCADE)
    product_id = models.ForeignKey('Products', on_delete=models.CASCADE)

    def __str__(self):
        return f"<OrderItems {self.item_id} {self.order_id}>"

    class Meta:
        pass
        unique_together = (("item_id", "order_id"),)


class Stocks(models.Model):
    quantity = models.IntegerField()
    store_id = models.ForeignKey('Store', on_delete=models.CASCADE)
    product_id = models.ForeignKey('Products', on_delete=models.CASCADE)

    def __str__(self):
        return f"<Stocks {self.store_id} {self.product_id}>"

    class Meta:
        unique_together = (("store_id", "product_id"),)
