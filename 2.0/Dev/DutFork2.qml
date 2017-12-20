import QtQuick 2.1
import MuseScore 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

MuseScore {
      version:  "2.1"
      description: "Create random score."
      menuPath: "Plugins.random"
      pluginType: "dock"
      dockArea:   "left"
      width:  150
      height: 75

      function addNote( cursor) {

            cursor.addNote(50);
            }

      onRun: {}
      function startScore()
      {
            var measures   = 18; //in 4/4 default time signature
            var numerator  = 3;
            var denominator = 4;
            var noteLens = [2,4,8,16];


            var score = newScore("Random.mscz", "marching-snare", measures);

            score.addText("title", "DutDutDutDut");
            score.addText("subtitle", "Dut");

            var cursor = score.newCursor();
            cursor.track = 0;

            cursor.rewind(0);

            var ts = newElement(Element.TIMESIG);
            ts.setSig(numerator, denominator);
            cursor.add(ts);

            cursor.rewind(0);
            generateScore(numerator, measures, noteLens,cursor);
            /*var realMeasures = Math.ceil(measures * denominator / numerator);
            console.log(realMeasures);
            var notes = realMeasures * 4; //number of 1/4th notes

            for (var i = 0; i < notes; ++i)
            {

                if (Math.random() < 0.5) {
                    cursor.setDuration(1, 8);
                    addNote(cursor);
                    addNote(cursor);

                    }
                else
                {
                    cursor.setDuration(1, 4);
                    addNote(cursor);
                }*/


                Qt.quit();

          }
          function generateScore(maxTime, measures, noteLens, cursor)
          {
            //maxTime: Numerator, total number of beats in a measure
            //measures: Number of measures
            //avaiableLen:

            for (var i = 0; i < measures; ++i)
            {

              var totalTime = 0;
              var count = 0;
              while (totalTime < maxTime)
                {
                count++;
                var duration = Math.floor(Math.random() * noteLens.length);
                //If statement checks if the note exceeds the measure threshold. If it does, then a note to fill in is added.
                  if(totalTime + 1/duration <= maxTime)
                  {
                    cursor.setDuration(1, noteLens[duration]);
                    addNote(cursor);
                    console.log("works");
                  }
                  else
                  {
                      console.log("overflowDetected");
                      //complete's measure if overflow is forsaw
                      var excess = maxTime - totalTime ;
                      console.log("excess" + excess);
                      var time = 1/excess;
                      console.log("time" + time);
                      //cursor.setDuration(1, time);
                      //addNote(cursor);

                  }
                    totalTime += 1/duration;
                    console.log("total" + totalTime);
                    console.log("count" + count);
                }
              }

              }
              GridLayout {
                  anchors.fill: parent
                  columns: 2
                  rowSpacing: 5


                  Text {
                      text: "Octaves"
                      color: "white"
                      }

                  SpinBox {
                      id: octaves
                      minimumValue: 1
                      maximumValue: 3
                      stepSize:     1
                      Layout.fillWidth: true
                      Layout.preferredHeight: 25
                      value: 1
                      }

                  Button {
                      text: "create"
                      Layout.columnSpan: 2
                      Layout.fillWidth: true
                      onClicked: {
                          startScore()
                          }
                      }
                  }

          }
