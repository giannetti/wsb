xquery version "3.1";

(:~ This library module contains XQSuite tests for the warservicebureau app.
 :
 : @author giannetti
 : @version 1.0.0
 : @see https://francescagiannetti.com/
 :)

module namespace tests = "https://francescagiannetti.com/wsb/apps/wsb/tests";

declare namespace test="http://exist-db.org/xquery/xqsuite";



declare
    %test:name('one-is-one')
    %test:assertTrue
    function tests:tautology() {
        1 = 1
};
