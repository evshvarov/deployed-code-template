Class dc.deployed.ObjectScript
{

ClassMethod Test() As %Status
{
    set a=42
    write "It is deployed class withoud source code!",!
    return a
}

}
