#Convert Binary(in ascii text) to ascii
function Convert-Binary-Ascii {
    Param ([string]$binary)
        if ($binary.length % 8 -eq 0) {
            $asciiText = ''
            $binaryArray = $binary  -split '(........)' | ? { $_ };
            ForEach($line in $($binaryArray)) {
                $_ = [Convert]::ToString([Convert]::ToInt32($line, 2), 16)
                $asciiText += [char][byte]"0x$_"
        }
        return $asciiText
    } else {
        throw "Binary string must be divisible by 8. I.e. a multiple of 8"
    }

}

#Convert ascii to binary text
function Convert-Ascii-Binary {
    Param ([string]$ascii)
    $binarytext = ""
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($ascii)
    ForEach ($line in $($bytes)){
        if ($line -ne "0") {
            $tmp = [Convert]::ToString($Line,2)
            if ($tmp.length -ne 8) {
                $zeros = "0" * (8 - $tmp.length)
                $binarytext += $zeros + $tmp
            } 
        }
    }
    return $binarytext
}
