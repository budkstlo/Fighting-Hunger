// import the necessary packages and libraries
import scala.io.Source
import scala.util._

// Create an object class for the program
object FightHunger {    

    // Function to read hunger data from a file
    def readHungerData(filename:String): Try[Seq[String]] = Try {
        Source.fromFile(filename).getLines.toSeq
    }

    // Function to separate hunger data into two groups
    def groupHungerData(data: Seq[String]): (Seq[String], Seq[String]) = {
        data.partition(d => d.contains("High"))      
    }

    // Function to analyze hunger data
    def analyzeHungerData(data: Seq[String]): Map[String, Int] = {
        val countries = data.map(_.split(" ")(0))
        countries
            .groupBy(c => c)
            .map { case (countryName, countryData) => (countryName, countryData.size) }
    }

    // Function to print analysis result
    def printAnalysisResult(analysis: Map[String, Int]) = {
        analysis.foreach { case (countryName, count) => println(s"Number of high hunger countries is $count in $countryName")}
    }

    // Function to execute the program
    def execute(filename:String): Unit = {
        readHungerData(filename) match {
            case Failure(exception) => println(s"There was an exception while reading the file: $exception")
            case Success(data) =>
                val (highHunger, other) = groupHungerData(data)
                val analysis = analyzeHungerData(highHunger)
                printAnalysisResult(analysis)
        }
    }
}

// Main method to start the program
def main(args: Array[String]): Unit = {
    val filename = args(0)
    FightHunger.execute(filename)
}