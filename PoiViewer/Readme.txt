Assumptions made in this project:

1)Numeric POIs are sorted into the section of depending on the Spelled out number

Futher Notes:
2) I have included a rudimentary set of unit tests for the PoiParser and the Poi Model. I tend to write tests for business logic and shared apis.
3) The SBJson Parser has a memory leak. I am using the parser as recommended. by calling the single method JSONValue on a JSON String

Next Steps. If I were to continue developing this program. I would
4) Add a Startup screen to let users know that it is loading
5) load the data into a database to avoid the startup costs of loading the data each time. 