import time, json
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(3, 5)

    @task(1)
    def api_page(self):
        response = self.client.get('/', verify=False)