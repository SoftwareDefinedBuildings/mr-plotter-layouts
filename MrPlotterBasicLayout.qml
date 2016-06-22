import QtQuick 2.0
import MrPlotter 0.1

Item {
    PlotArea {
        id: ddpa
        anchors.left: pa.left
        width: pa.width
        height: 70
        yaxisarea: ddyaa
    }

    YAxisArea {
        id: ddyaa
        y: 0
        anchors.right: ddpa.left
        width: yaa.width
        height: parent.height
        rangeStart: ddpa.y + ddpa.height
        rangeEnd: ddpa.y
    }

    PlotArea {
        id: pa
        y: ddpa.height + 15
        anchors.left: yaa.right
        width: parent.width - yaa.width
        height: Math.max(parent.height - taa.height - ddpa.height, 60)
        yaxisarea: yaa
    }

    YAxisArea {
        id: yaa
        y: 0
        anchors.left: parent.left
        width: Math.min(parent.width / 4, 300)
        height: parent.height
        rangeStart: pa.y + pa.height
        rangeEnd: pa.y
    }

    TimeAxisArea {
        id: taa
        anchors.top: pa.bottom
        x: 0
        width: parent.width
        height: 70
        rangeStart: pa.x
        rangeEnd: pa.x + pa.width
    }

    MrPlotter {
        id: mrp
        mainPlot: pa
        dataDensityPlot: ddpa
        timeaxisarea: taa
    }
}
