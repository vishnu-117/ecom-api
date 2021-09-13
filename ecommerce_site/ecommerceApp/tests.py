import json
from rest_framework.test import APIClient
from rest_framework import status
from django.urls import reverse
from rest_framework.test import APITestCase
from .models import Orders, Customers, Store, Staffs


class TestGetOrdersDetailByStoreAPI(APITestCase):

    def test_get_orders_details_by_store(self):
        data = {
        "order_id": 1,
        "customer_name": "vtu thuletiya",
        "customer_city": "Gandhinagar",
        "customer_state": "GU",
        "customer_email": "vtu@gmail.com",
        "store_city": "Bangalore",
        "store_state": "Bangalore",
        "line_items": {
            "item_id": 1,
            "product_id": 1,
            "product_name": "Apple iPhone 12 Pro Max",
            "brand_id": 6,
            "list_price": 100000.0,
            "discount": 20.0,
            "quantity": 20,
            "final_price": 99980.0
        },
        "order_status": "Processing",
        "order_date": "2021-09-10T20:21:52Z",
        "required_date": "2021-09-10T20:21:58Z",
        "shipped_date": "2021-09-10T20:22:00Z",
        "customer_id": 1,
        "store_id": 1,
        "staff_id": 1
        }
        response = self.client.get(reverse("get_orders_details_by_store"), {'store_name': 'shopnix'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class TestGetProductDetailsByCategoryAPI(APITestCase):

    def test_get_product_details_by_category(self):
        data = {
            "product_id": 1,
            "stor_id": 1,
            "stor_name": "shopnix",
            "city": "Bangalore",
            "state": "Bangalore",
            "brand_name": "Apple",
            "quantity": 10,
            "category_name": "Smart Phone",
            "product_name": "Apple iPhone 12 Pro Max",
            "model_year": 2019,
            "list_price": 100000.0,
            "brand_id": 6,
            "category_id": 7
            }
        response = self.client.get(reverse("get_product_details_by_category"), {'store_name': 'shopnix', 'category_name':'Smart Phone'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class TestOrdersViewSetAPI(APITestCase):

    def setUp(self):
        customer_data = {
            "first_name": "vtu1",
            "last_name": "thuletiya",
            "phone": "8795678907",
            "email": "vtu@gmail.com",
            "street": "kishan nagar",
            "city": "Gandhinagar",
            "state": "GU",
            "zip_code": "382026"
        }
        store_data = {
            "store_name": "shopnix1",
            "phone": "888 07 888 13",
            "email": "support@shopnix.in",
            "street": "South End Road",
            "city": "Bangalore",
            "state": "Bangalore",
            "zip_code": "560030"
        }

        self.customers = Customers.objects.create(**customer_data)
        self.store = Store.objects.create(**store_data)
        staff_data = {
            "first_name": "vishnu1",
            "last_name": "thuletiya",
            "email": "vishnu@gmail.com",
            "phone": "9512545108",
            "store_id": self.store,
            "active": "yes",
        }
        self.staffs = Staffs.objects.create(**staff_data)
        order_data = {
        "order_status": "Processing",
        "order_date": "2021-09-10T20:21:52Z",
        "required_date": "2021-09-10T20:21:58Z",
        "shipped_date": "2021-09-10T20:22:00Z",
        "customer_id": self.customers,
        "store_id": self.store,
        "staff_id": self.staffs
        }
        self.order = Orders.objects.create(**order_data)
        self.url = reverse("test_delete_order", kwargs={"pk": self.order.pk})

    def test_get_order(self):
        data = {
            "order_id": 1,
            "order_status": "Processing",
            "order_date": "2021-09-10T20:21:52Z",
            "required_date": "2021-09-10T20:21:58Z",
            "shipped_date": "2021-09-10T20:22:00Z",
            "customer_id": 1,
            "store_id": 1,
            "staff_id": 1
            }
        response = self.client.get(reverse("test_get_order"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_post_order(self):
        data = {
        "order_status": "Processing",
        "order_date": "2021-09-10T20:21:52Z",
        "required_date": "2021-09-10T20:21:58Z",
        "shipped_date": "2021-09-10T20:22:00Z",
        "customer_id": self.customers,
        "store_id": self.store,
        "staff_id": self.staffs
        }
        self.client.post(reverse("test_post_order"), data=data)
        self.assertEqual(Orders.objects.count(), 1)

    def test_delete_order(self):
        response = self.client.delete(self.url)
        self.assertEqual(204, response.status_code)
