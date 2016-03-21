module OrdersHelper
     def checked(area)
        @order.Toppings.nil? ? false : @order.Toppings.match(area)
     end
end
