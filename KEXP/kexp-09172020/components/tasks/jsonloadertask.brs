sub Init()
    m.top.functionName = "GetContent" 'call API on creation
end sub

sub GetContent()

    ' request = CreateObject("roUrlTransfer")
    ' request.SetUrl("http://192.168.0.40:8888/server/roku-tutorial/roku_demo.json")
    ' response = request.GetToString()
    ' json = ParseJson(response)
    ' '? json

    ' ===========================================================
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")

    'xfer.SetURL("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    xfer.SetURL("https://api.kexp.org/v1/play")

    ' ========== Doesn't work ===============
    'xfer.SetURL("http://192.168.0.40:8888/server/roku-tutorial/roku_demo.json")
    ' ========== Doesn't work ===============
    

    rsp = xfer.GetToString()
    rootChildren = []
    rows = {}
    json = ParseJson(rsp)

    for each category in json

        'Get Each JSON Parent Node
        value = json.Lookup(category)

        ? category

        ' ===========================================================
        '   KEXP
        ' ===========================================================
        if Type(value) = "roArray"
            if category = "results"
                for each item in value
                    ? Type(item.artist)
                end for
            end if
        end if 

        ' ===========================================================
        '   DEMO
        ' ===========================================================
        ' if Type(value) = "roArray"
        '     if category <> "series"
        '         for each item in value
        '             ? item.shortDescription
        '         end for
        '     end if
        ' end if 
        
    end for


    ' ===========================================================
    ' ' parse the feed and build a tree of ContentNodes to populate the GridView

    ' if json <> invalid
    '     for each category in json
    '         value = json.Lookup(category)
    '         if Type(value) = "roArray" ' if parsed key value having other objects in it
    '             if category <> "series" ' ignore series for this phase
    '                 row = {}
    '                 row.title = category
    '                 row.children = []
    '                 for each item in value ' parse items and push them to row
    '                     itemData = GetItemData(item)
    '                     row.children.Push(itemData)
    '                 end for
    '                 rootChildren.Push(row)
    '             end if
    '         end if
    '     end for
    '     ' set up a root ContentNode to represent rowList on the GridScreen
    '     contentNode = CreateObject("roSGNode", "ContentNode")
    '     contentNode.Update({
    '         children: rootChildren
    '     }, true)
    '     ' populate content field with root content node.
    '     ' Observer(see OnMainContentLoaded in MainScene.brs) is invoked at that moment
    '     m.top.content = contentNode
    ' end if
end sub