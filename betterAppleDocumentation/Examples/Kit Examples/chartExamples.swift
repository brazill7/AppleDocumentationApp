//
//  chartExamples.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 5/25/23.
//

import SwiftUI
import Charts


struct pointRectangleChartData: Identifiable{
    var id = UUID()
    var name: String
    var happiness: Int
}

struct pointRectangleChartExample: View{
    var data:[pointRectangleChartData] = [
        .init(name: "Allison", happiness: 8),
        .init(name: "Sarah", happiness: 6),
        .init(name: "Claire", happiness: 10),
        .init(name: "Brie", happiness: 2),
        .init(name: "Marie", happiness: 8),
    ]
    
    public var code = #"""
    import SwiftUI
    import Charts


    struct pointRectangleChartData: Identifiable{
        var id = UUID()
        var name: String
        var happiness: Int
    }

    struct pointRectangleChartExample: View{
        var data:[pointRectangleChartData] = [
            .init(name: "Allison", happiness: 8),
            .init(name: "Sarah", happiness: 6),
            .init(name: "Claire", happiness: 10),
            .init(name: "Brie", happiness: 2),
            .init(name: "Marie", happiness: 8),
        ]
        
        var body: some View{
            ScrollView {
                VStack{
                    Text("Point Chart")
                    Chart{
                        ForEach(data){ plot in
                            PointMark(
                                x: .value("Name", plot.name),
                                y: .value("Age", plot.happiness)
                            )
                        }
                    }
                    .frame(width: 350, height: 400)
                }
                VStack{
                    Text("Rectangle Chart")
                    Chart{
                        ForEach(data){ plot in
                            RectangleMark(
                                x: .value("Name", plot.name),
                                y: .value("Age", plot.happiness)
                            )
                        }
                    }
                    .frame(width: 350, height: 400)
                }
            }
        }
    }

    """#
    var body: some View{
        ScrollView {
            VStack{
                Text("Point Chart")
                Chart{
                    ForEach(data){ plot in
                        PointMark(
                            x: .value("Name", plot.name),
                            y: .value("Age", plot.happiness)
                        )
                    }
                }
                .frame(width: 300, height: 400)
            }
            VStack{
                Text("Rectangle Chart")
                Chart{
                    ForEach(data){ plot in
                        RectangleMark(
                            x: .value("Name", plot.name),
                            y: .value("Age", plot.happiness)
                        )
                    }
                }
                .frame(width: 300, height: 400)
            }
        }
    }
}


struct lineChartData: Identifiable{
    var id = UUID()
    var hour: String
    var temp: Int
}

struct lineChartExample: View{
    var data: [lineChartData] = [
        .init(hour: "7PM", temp: 60),
        .init(hour: "8PM", temp: 62),
        .init(hour: "9PM", temp: 65),
        .init(hour: "10PM", temp: 67),
        .init(hour: "11PM", temp: 69),
        .init(hour: "12PM", temp: 72),
        .init(hour: "1PM", temp: 77),
        .init(hour: "2PM", temp: 82),
        .init(hour: "3PM", temp: 80),
        .init(hour: "4PM", temp: 78)
    ]
    
    public var code = #"""
    import SwiftUI
    import Charts

    struct lineChartData: Identifiable{
        var id = UUID()
        var hour: String
        var temp: Int
    }

    struct lineChartExample: View{
        var data: [lineChartData] = [
            .init(hour: "7PM", temp: 60),
            .init(hour: "8PM", temp: 62),
            .init(hour: "9PM", temp: 65),
            .init(hour: "10PM", temp: 67),
            .init(hour: "11PM", temp: 69),
            .init(hour: "12PM", temp: 72),
            .init(hour: "1PM", temp: 77),
            .init(hour: "2PM", temp: 82),
            .init(hour: "3PM", temp: 80),
            .init(hour: "4PM", temp: 78)
        ]
        
        var body: some View{
            VStack{
                Text("10 Hour Temperature Outlook")
                Chart{
                    ForEach(data){ plot in
                        LineMark(
                            x: .value("Name", plot.hour),
                            y: .value("Age", plot.temp)
                        )
                    }
                }.foregroundColor(.green)
                .frame(width: 400, height: 400)
            }
        }
    }
    """#
    
    var body: some View{
        VStack{
            Text("10 Hour Temperature Outlook")
            Chart{
                ForEach(data){ plot in
                    LineMark(
                        x: .value("Name", plot.hour),
                        y: .value("Age", plot.temp)
                    )
                }
            }.foregroundColor(.green)
            .frame(width: 350, height: 400)
        }
    }
}






struct barChartData: Identifiable{
    var id = UUID()
    var name: String
    var numOfPeoplesFavorite: Int
}

struct barChartExample: View {
    @State var code = #"""
import SwiftUI
import Charts

struct barChartData: Identifiable{
    var id = UUID()
    var name: String
    var numOfPeoplesFavorite: Int
}

struct barChartExample: View {
    
    var data: [barChartData] = [
        .init(name: "Summer", numOfPeoplesFavorite: 51),
        .init(name: "Winter", numOfPeoplesFavorite: 23),
        .init(name: "Spring", numOfPeoplesFavorite: 67),
        .init(name: "Fall", numOfPeoplesFavorite: 55)
    ]
    
    var body: some View {
        VStack{
            Text("Survey Results - (Favorite Season)")
            Chart{
                ForEach(data){ plot in
                    BarMark(
                        x: .value("Name", plot.name),
                        y: .value("Age", plot.numOfPeoplesFavorite)
                    )
                }
            }
            .frame(width: 400, height: 400)
        }
    }
}
"""#
    var data: [barChartData] = [
        .init(name: "Summer", numOfPeoplesFavorite: 51),
        .init(name: "Winter", numOfPeoplesFavorite: 23),
        .init(name: "Spring", numOfPeoplesFavorite: 67),
        .init(name: "Fall", numOfPeoplesFavorite: 55)
    ]
    
    var body: some View {
        VStack{
            Text("Survey Results - (Favorite Season)")
            Chart{
                ForEach(data){ plot in
                    BarMark(
                        x: .value("Name", plot.name),
                        y: .value("Age", plot.numOfPeoplesFavorite)
                    )
                }
            }
            .frame(width: 300, height: 400)
        }
    }
}

struct chartExamples_Previews: PreviewProvider {
    static var previews: some View {
        pointRectangleChartExample()
    }
}
