xquery version "3.1";

(: let $date := "July 15, 2022"
return
fn:format-date($date, "[Y0001]-[M01]-[D01]") :)

let $date := "July 15, 2022"
let $tokens := fn:tokenize($date, " ")
let $month :=
  switch ($tokens[1]) 
    case "January" return "01"
    case "February" return "02"
    case "March" return "03"
    case "April" return "04"
    case "May" return "05"
    case "June" return "06"
    case "July" return "07"
    case "August" return "08"
    case "September" return "09"
    case "October" return "10"
    case "November" return "11"
    case "December" return "12"
    default return "01"
let $day := $tokens[2] => translate(",","")
let $year := $tokens[3]
return xs:date($year || "-" || $month ||  "-" || $day )