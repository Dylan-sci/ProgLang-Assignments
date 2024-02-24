class PhoneBook
    def initialize
        @contacts = []
    end

    def add(name, number, is_listed)
        # (String, String, Bool) -> Bool

        # Check if number format is correct
        if number !~ /^\d{3}-\d{3}-\d{4}$/
            return false
        end

        # Check if contact exists
        if @contacts.any? { |contact| contact[:name] == name && contact[:number] == number }
            return false
        end
  
        # Check if number exists
        if is_listed && @contacts.any? { |contact| contact[:number] == number && contact[:is_listed] }
            return false
        end

        # Add contact to phonebook
        @contacts << { name: name, number: number, is_listed: is_listed }
        true
    end

    def lookup(name)
        # (String) -> String or nil

        # Search for given name from contacts
        contact = @contacts.find { |contact| contact[:name] == name && contact[:is_listed] }

        # If contact with the specified name is found, return its phone number. Else, return nil.
        if contact
            return contact[:number]
        else
            return nil
        end
    end

    def lookupByNum(number)
        # (String) -> String or nil

        # Search for given number from contacts
        contact = @contacts.find { |contact| contact[:number] == number && contact[:is_listed] }

        # If contact with the specified number is found, return its name. Else, return nil.
        if contact
            return contact[:name]
        else
            return nil
        end
    end

    def namesByAc(areacode)
        # (String) -> Array

        matching_names = []

        # Find every contact that starts with a given areacode
        @contacts.each do |contact|
            if contact[:number].start_with?(areacode)
                matching_names << contact[:name]
            end
        end
      
        matching_names
    end
end
