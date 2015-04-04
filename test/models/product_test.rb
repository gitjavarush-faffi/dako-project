require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url)
    Product.new(title: 'tmpTitle',
                description: 'tmpDescription',
                image_url: image_url,
                price: 5)
  end

  def new_product_title_test(title)
    Product.new(title: title,
                description: 'tmpDescription',
                image_url: 'image_url.png',
                price: 5)
  end

  test "everything is field" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title: 'tmpTitle',
                          description: 'tmpDescription',
                          image_url: 'tmpImageUrl.png')
    product.price = -1;
    assert product.invalid?
    assert_equal ['The number must be greater then 0.01'],
        product.errors[:price]

    product.price = 0;
    assert product.invalid?
    assert_equal ['The number must be greater then 0.01'],
        product.errors[:price]

    product.price = 1;
    assert product.valid?
  end

  test "image url valid or invalid" do
    ok = %w{tmp.png Tmp.png Tmp.Png tmp.jpg tmp.jpeg tmp.gif http://a.b.c/x/y/z/fred.gif}
    bad = %w{tmp.doc tmp.rtp tmp.gif.more tmp.bat}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} souldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} souldn't be valid"
    end
  end

  test "uniq title" do
    product = Product.new(title: products(:yason).title,
                          description: products(:yason).description,
                          image_url: products(:yason).description,
                          price: 9.99)
    assert product.invalid?
    assert_equal ['The title has already been taken'],
        product.errors[:title]
                                #assert_equal [I18n.translate('activerecord.errors.messages.taken')],
                                #product.errors[:title]
  end

  test "check length of title" do
    ok = %w{temp qwert qwerty qwertyu qwertyui qwertyuio qwertyuiop}
    bad = %w{q qw qwe qwertyuiopa}

    ok.each do |title|
      assert new_product_title_test(title).valid?, "#{title} shouldn't be invalid"
    end

    bad.each do |title|
      assert new_product_title_test(title).invalid?, "#{title} shouldn't be valid"
    end
  end

end
