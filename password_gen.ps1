$my_Array = @((48..57),(65..90),(97..122),(33..36),(42..46))

function random_char{
    $rand = Get-Random -minimum 0 -Maximum 3
    $my_Array[$rand] | Get-Random -Count 1 | %{[char]$_}
}

function password_gen{
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
    $password = password_gen -length 25
    if($password -match "[A-Z][A-Z][A-Z]"){
    }
    elseif($password -match "[a-z][a-z][a-z]"){
    }
    elseif($password -match "[0-9][0-9][0-9]"){
    }
    elseif($password -match "[_*][_*]"){
    }
    else{
        Write-Output $password
        $end = $true
    }
}
