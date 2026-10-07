//
//  MissionView.swift
//  Moonshot
//
//  Created by Onur Ay on 26.07.26.
//

import SwiftUI


struct CrewMember  {
    let role: String
    let astronaut: Astronaut
}

struct MissionView : View {
    
  
    
    let mission: Mission
    let crew: [CrewMember]
        
    var body : some View {
        
        ScrollView {
            VStack {
                
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        
                        width * 0.6
                        
                    }
                
                Text(mission.formattedLaunchDate)
                    .font(.title2.bold())
                    .padding(.top)
                
                
                VStack(alignment: .leading) {
                    
                    Rectangle()
                    .frame(height:2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                    
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                        
                    Text(mission.description)
                    
                    Rectangle()
                    .frame(height:2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                }
                .padding(.horizontal)
                
                HorizontalScrollView(crew: crew, mission: mission)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
            
        }
    }
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView( mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
