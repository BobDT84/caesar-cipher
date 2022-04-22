def caesar_cipher(message,shift)
    unless shift > 0 && shift < 26
        shift = shift % 26
    end

    bytes_message = message.bytes.map do |byte|
        if !(65..90).include?(byte) && !(97..122).include?(byte)
            #ignore anything that is not A-Z or a-z
            next byte
        end
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



p caesar_cipher('abcDEFGhijklmnopqrstuvwxyz',2) #=> "cdeFGHIjklmnopqrstuvwxyzab"
p caesar_cipher('A',52) #=> "A"
p caesar_cipher('Z',8) #=> "H"
p caesar_cipher('A',-77) #=> "B"
p caesar_cipher('A',27) #=> "B"
p caesar_cipher('Hello, World!',1) #=> "Ifmmp, Xpsme!"
p caesar_cipher('Ifmmp, Xpsme!',-1) #=> "Hello, World!"