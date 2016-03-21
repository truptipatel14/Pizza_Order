class Order < ActiveRecord::Base
    before_save do
        self.Toppings.gsub!(/[\[\]\"]/, "") if attribute_present?("Toppings")
    end
end
 