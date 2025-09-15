class PhoneBook
    def initialize
        @listedContacts = Hash.new
        @unlistedContacts = Hash.new
    end

    def add(name, number, is_listed)
        if @listedContacts.has_key?(name) or @unlistedContacts.has_key?(name) then
            return false
        end

        if !(number =~ /[0-9]{3}-[0-9]{3}-[0-9]{4}$/) then
            return false
        end
        if is_listed then
            if @listedContacts.has_value?(number) then
                return false
            end
            @listedContacts[name] = number
        else
            @unlistedContacts[name] = number
        end
        return true
    end

    def lookup(name)
        return @listedContacts[name]
    end

    def lookupByNum(number)
       @listedContacts.each do |key, value|
            if value == number then
                return key
            end
        end
        return nil
    end

    def namesByAc(areacode)
        names = []

        @listedContacts.each do |key, value|
            if value.start_with?(areacode) then
                names.push(key)
            end
        end

        @unlistedContacts.each do |key, value|
            if value.start_with?(areacode) then
                names.push(key)
            end
        end
        return names
    end
end
