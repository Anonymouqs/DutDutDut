import QtQuick 2.1
import MuseScore 1.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
MuseScore {
      version:  "2.1"
      description: "Create random score."
      menuPath: "Plugins.random"

      function addNote( cursor) {

            cursor.addNote(50);
            }

      onRun: {startScore()}
      function startScore()
      {
            var measures   = 18; //in 4/4 default time signature
            var numerator  = 3;
            var denominator = 4;
            var noteLens = [2,4,8,16];
            var availableLen = noteLens.length; // total number of rhythm types available


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
            var realMeasures = Math.ceil(measures * denominator / numerator);
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
                }

            /*
function generateScore(maxTime, measures)
{

            for (var i = 0; i < measures; ++i)
            {
            var totalTime = 0;


              while (totalTime < maxTime)
              {

              duration = Math.ceil(Math.Random * availableLen);
              totalTime -= 1/duration;
              if(duration < maxTime)
                {
                  cursor.setDuration(1, noteLens[duration]);
                  addNote(cursor);
                  cursor.addNote();
              }
            }



            }
          }*/
              }
            Qt.quit();
            }
            GridLayout {
                anchors.fill: parent
                columns: 2
                rowSpacing: 5


                Text {
                    text: "Octaves"
                    color: "white"
                    }


                Button {
                    text: "create"
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    onClicked: {
                        //createScore(octaves.value)
                        }
                    }
                }

      }
