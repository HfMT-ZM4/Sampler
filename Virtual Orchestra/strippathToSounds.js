function anything()
{
a = arrayfromargs(messagename, arguments);
outlet(0, a[0].substring(a[0].indexOf("sounds")+7));
}