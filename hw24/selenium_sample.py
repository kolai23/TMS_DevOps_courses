#!/usr/bin/python3
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
import unittest


class SeleniumTest(unittest.TestCase):
    # download Chrome & driver from https://googlechromelabs.github.io/chrome-for-testing/#stable
    def setUp(self):
        options = webdriver.ChromeOptions()
        options.binary_location = "./chrome-win64/chrome.exe"
        options.add_argument('--incognito')

        service = Service(executable_path='./chromedriver-win64/chromedriver.exe')

        self.browser = webdriver.Chrome(options=options, service=service)

    def tearDown(self):
        self.browser.close()

    def test_title(self):
        self.browser.get("https://google.com")
        message = "title == title"
        self.assertIn("Google", self.browser.title, message)

    def test_page_source(self):
        self.browser.get("https://google.com")
        search = self.browser.find_element(By.NAME, "q")
        search.clear()
        search.send_keys("teachmeskills.by")
        search.submit()
        WebDriverWait(self.browser, 10).until(EC.presence_of_element_located((By.ID, "res")))
        self.assertIn("TeachMeSkills - это школа программирования, где мы научим тебя востребованным сегодня знаниям.", self.browser.page_source)

    def skip_google_popup(self):
        # WebDriverWait(self.browser, 10).until(EC.element_to_be_clickable((By.XPATH, "//button/div[contains(string(), 'Alle ablehnen')]"))).click()
        WebDriverWait(self.browser, 10).until(EC.element_to_be_clickable((By.XPATH, "//button/div[contains(string(), 'Odrzuć wszystko')]"))).click()
if __name__ == '__main__':
    unittest.main()