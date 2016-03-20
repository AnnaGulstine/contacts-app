class Contact < ActiveRecord::Base
  belongs_to :user
  
  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")    
  end
  def full_name
    first_name + " " + last_name
  end

  def country_code
    if (phone_number[0] == "8" && phone_number[1] == "1") == false
      country_code = "+81 " + phone_number
    else
      phone_number
    end
  end

  def if_address
    if address 
      address
    else
      " "
    end
  end
end