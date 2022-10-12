require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

Given("user had been on landing page elevania") do
  driver.navigate.to 'https://www.elevenia.co.id/'
  driver.find_element(:class, 'btn-close').click
  sleep(2)

rescue Selenium::WebDriver::Error::NoSuchElementError # in case no banner in landing page
end

And("user search komputer on search type") do
  driver.find_element(:class, 'searchText').send_keys 'komputer'
  driver.find_element(:class, 'btn-search').click
end

And("user select tab produk terlaris") do
  driver.find_element(:xpath,"//a[text()='Produk terlaris']").click
  sleep(2)
  driver.find_elements(:class, 'itemList').first.click
end

And("user add item to cart with 3 quantity") do
  driver.find_element(:name, 'optionStock').clear
  driver.find_element(:name, 'optionStock').send_keys '3'
  driver.find_element(:xpath,"//a[text()='Tambahkan ke Cart']").click
  sleep(2)
  driver.find_element(:xpath,"//a[text()='Ya']").click
end

When("user cancel to change courier") do
  driver.find_element(:name, 'deliveryChangePopup').click
  driver.switch_to().frame('ifrLayer')
  driver.find_element(:xpath,"//a[text()='Batal']").click
  driver.switch_to().parent_frame()
end

And("user delete item from the cart") do
  driver.find_element(:xpath, "//td/a[text()='Hapus']").click
end

Then("the popup confirmations will have displayed") do
  driver.find_element(:id, 'chkDelPopY').click
end
