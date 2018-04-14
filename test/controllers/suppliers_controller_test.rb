require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get suppliers_url
    assert_response :success
  end

  test "should get new" do
    get new_supplier_url
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post suppliers_url, params: { supplier: { address: @supplier.address, contact_email: @supplier.contact_email, contact_name: @supplier.contact_name, contact_phone: @supplier.contact_phone, description: @supplier.description, name: @supplier.name, school_id: @supplier.school_id, slug: @supplier.slug } }
    end

    assert_redirected_to supplier_url(Supplier.last)
  end

  test "should show supplier" do
    get supplier_url(@supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_url(@supplier)
    assert_response :success
  end

  test "should update supplier" do
    patch supplier_url(@supplier), params: { supplier: { address: @supplier.address, contact_email: @supplier.contact_email, contact_name: @supplier.contact_name, contact_phone: @supplier.contact_phone, description: @supplier.description, name: @supplier.name, school_id: @supplier.school_id, slug: @supplier.slug } }
    assert_redirected_to supplier_url(@supplier)
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete supplier_url(@supplier)
    end

    assert_redirected_to suppliers_url
  end
end
