//
//  ContentView.swift
//  Moonshot
//
//  Created by Onur Ay on 26.07.26.
//

import SwiftUI

struct ContentView: View {
    @State private var listOrGrid: Bool = false

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {

        NavigationStack {

            if !listOrGrid {

                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in

                            NavigationLink(value: mission) {

                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()

                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }

                        }
//

                    }
                    .navigationDestination(for: Mission.self) {
                                             selectedMission in
                                             MissionView(
                                                 mission: selectedMission,
                                                 astronauts: astronauts
                                             )
                                         }

                    .padding([.horizontal, .bottom])
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar {
                    Button {
                        listOrGrid.toggle()
                    } label: {
                        Text("List or Grid?")
                    }
                }

            } else {

                List {
                    ForEach(missions) { mission in
                        
                        NavigationLink(value: mission) {

                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                        


                    }
                    .padding([.horizontal, .bottom])
                

                }
                .navigationDestination(for: Mission.self) {
                                         selectedMission in
                                         MissionView(
                                             mission: selectedMission,
                                             astronauts: astronauts
                                         )
                                     }

                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar {
                    Button {
                        listOrGrid.toggle()
                    } label: {
                        Text("List or Grid?")
                    }
                }

            }

        }

    }
}

#Preview {
    ContentView()
}
