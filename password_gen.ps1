function password_gen{
    param([int]$length)

    $my_Array = @((48..57),(65..90),(97..122),(33,35,36))

    function random_char{
        $rand = Get-Random -minimum 0 -Maximum 4
        $my_Array[$rand] | Get-Random -Count 1 | %{[char]$_}
    }

    function generate{
        param([int]$length)
        $password=@()
        [int]$counter = 0
        while($counter -lt $length){
            $password += random_char
            $counter += 1
        }
        $password -join ''
    }

    $end = $false
    while($end -eq $false){
        $password = generate -length $length
        if($password -match "[A-Z]"*3){
        }
        elseif($password -match "[0-9]"*3){
        }
        elseif($password -match "[_*]"*3){
        }
        else{
            Write-Output $password | clip
            Write-Host "Password copied to clipboard" -ForegroundColor Green
            $end = $true
        }
    }
}
