class Order < ActiveRecord::Base
    before_save do
       self.Toppings.gsub!(/[\[\]\"]/, "") if attribute_present?("Toppings")
    end
      zip_canada = /\A[a-zA-Z]{1}\d{1}[a-zA-Z]{1}[ -]?\d{1}[a-zA-Z]{1}\d{1}\z/
      validates :PostalCode, :presence => true, :format => { :with => zip_canada }
      
      phonenumber_validation =  /\d{3}-\d{3}-\d{4}/
      validates :PhoneNumber, :presence => true, :format => { :with => phonenumber_validation , message: " - please use this format 123-234-3456"  }
      
      validates :City, presence: true
      
      validates :Address, presence:true
      
      validates :Size, presence:true
      
      validates :Crust, presence:true
      
        
    def Price
        @TotalPrice = 0;
        @Size = 0;
        @CrustPrice = 0;
        @ToppingPrice = 0;
        @tax = 0;
        
        if self.Size == "Small"
          @Size = 5.00
        elsif self.Size == "Medium"
          @Size = 10.00
        elsif self.Size == "Large"
          @Size = 15.00
        elsif self.Size == "Extra Large"
          @Size = 20.00
        end
        
       if attribute_present?("Toppings")
          @ToppingPrice = self.Toppings.count(',') * 0.5
       end
        
        if self.Crust == "Stuffed Crust"
            @CrustPrice =  2.0;
        end
        
        if self.Province == "Ontario"
           @tax = 0.13
        elsif self.Province == "Manitoba"
           @tax = 0.10
        elsif self.Province == "Saskatchewan"
           @tax = 0.15
        elsif self.Province == "Quebec"
           @tax = 0.11
        end
        
        @TotalPrice = @Size + @CrustPrice + @ToppingPrice;
              
        return ( (@tax * @TotalPrice) + @TotalPrice)
        
    end
end
 