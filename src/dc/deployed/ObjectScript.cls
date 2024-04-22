Class dc.deployed.ObjectScript
{

ClassMethod Test() As %Status
{
    set a=42
    write "It is a deployed class without source code!",!
    return a
}

}
