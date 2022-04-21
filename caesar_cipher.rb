def caesar_cipher(message,shift)
    until shift > 0 && shift < 26
        shift < 0 ? shift += 26 : shift -= 26
    end

    bytes_message = message.bytes.map do |byte|
        new_byte = byte + shift
        upcase_bytes = (65..90)
        downcase_bytes = (97..122)
        case true
        when upcase_bytes.include?(byte)
            case true
            when upcase_bytes.include?(new_byte)
                new_byte
            when new_byte > 90
                new_byte - 26
            when new_byte < 65
                new_byte + 26
            end
        when downcase_bytes.include?(byte)
            case true
            when downcase_bytes.include?(new_byte)
                new_byte
            when new_byte > 122
                new_byte - 26
            when new_byte < 97
                new_byte + 26
            end
        else
            puts "#{byte} is not a correct letter"
            p new_byte
            p byte
        end
    end
    bytes_message.pack('c*')
end


p caesar_cipher('abcDEFGhijklmnopqrstuv',2)
p caesar_cipher('A',8)