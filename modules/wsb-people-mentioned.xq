xquery version "3.1";

(: take letter anthology input and produce a list of people mentioned :)

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace wsb = "https://francescagiannetti.com/wsb";

declare variable $exist:root as xs:string := 
    request:get-parameter("exist:root", "xmldb:exist:///db/apps");
declare variable $exist:controller as xs:string := 
    request:get-parameter("exist:controller", "/wsb");
declare variable $path-to-data as xs:string := 
    $exist:root || $exist:controller || '/data';
(: Cf day 2
 : declare variable $path-to-data as xs:string := '/db/data'; 
 :)
declare variable $letters := doc($path-to-data || '/brachereg.xml');
declare variable $people as element(tei:listPerson)+ := $letters//tei:listPerson;

let $person as element(tei:persName)+ := $people/tei:persName[@type = 'display']
return
    <wsb:people>
    {
        for $person in $people
        return
        $person ! string()
    }
    </wsb:people>