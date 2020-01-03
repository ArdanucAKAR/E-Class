using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Interactions;

namespace Test
{
    [TestClass]
    public class Tests
    {
        IWebDriver driver;
        [TestMethod]
        public void OpenWebsite()
        {
            driver = new ChromeDriver();
            driver.Url = "http://localhost:53152/index.aspx";
        }

        [TestMethod]
        public void Login()
        {
            driver = new ChromeDriver();

            driver.Url = "http://localhost:53152/index.aspx";

            IWebElement web = driver.FindElement(By.XPath("/html/body/div/main/p[2]/a"));

            web.Click();

            web = driver.FindElement(By.Id("inputEmail"));

            web.SendKeys("akarardanuc@gmail.com");

            web = driver.FindElement(By.Id("inputPassword"));

            web.SendKeys("123123123");

            web.Submit();
        }

        [TestMethod]
        public void Register()
        {
            driver = new ChromeDriver();

            driver.Url = "http://localhost:53152/index.aspx";

            IWebElement web = driver.FindElement(By.XPath("/html/body/div/main/p[2]/a"));

            web.Click();

            web = driver.FindElement(By.XPath("//*[@id=\"loginForm\"]/a"));

            web.Click();

            web = driver.FindElement(By.Id("inputEmail"));

            web.SendKeys("deneme@gmail.com");

            web = driver.FindElement(By.Id("password"));

            web.SendKeys("123123123");

            web = driver.FindElement(By.Id("password_again"));

            web.SendKeys("123123123");

            web.Submit();
        }
    }
}
