def caesar_cipher(message,shift)
    until shift > 0 && shift < 26
        shift < 0 ? shift += 26 : shift -= 26
    end

    bytes_message = message.bytes.map do |byte|
        shifted_byte = byte + shift
        if cipher_wraps?(byte, shifted_byte)
            shifted_byte = shifted_byte - 26
        end
        shifted_byte
    end
    bytes_message.pack('c*')
end

def cipher_wraps?(byte, shifted_byte)
    upcase_bytes = (65..90)
    downcase_bytes = (97..122)
    if upcase_bytes.include?(byte) && upcase_bytes.include?(shifted_byte)
        return false
    elsif downcase_bytes.include?(byte) && downcase_bytes.include?(shifted_byte)
        return false
    else
        return true
    end
end



p caesar_cipher('abcDEFGhijklmnopqrstuvwxyz',2)
p caesar_cipher('A',8)