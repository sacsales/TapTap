import SwiftUI


struct ContentView: View {
    
    
    @State private var color = Color(uiColor: .blue)
    @State private var counter = -15.0
    @State private var message = ""
    
//    @AppStorage("color") var color = Color(uiColor: .blue)
//
//    @AppStorage("counter") var counter = -15.0
//    @AppStorage("message") var message = ""
  
    
    //states are noisy. when value changes, it lets everything in the view know.
    //keep states private - coding convention.
    
   
    
    func checkTemp() {
        if counter > 55 {
            counter = 20
            message = "Take it down a notch. Do you want me to burn??"
            color = .yellow
        }
        else if counter >= 50 {
            message = "This is about the record temperature here in the UAE."
            color = .red
        } else if counter >= 40 {
            message =  "It's boiling!!"
            color = .red
        } else if counter >= 30 {
            message =  "Getting quite warm..."
            color = .orange
        } else if counter >= 20 {
            message = "Oh. Pretty pleasant."
            color = .yellow
        } else if counter >= 10 {
            message = "Getting chilly..."
            color = .teal
        } else if counter >= 0 {
            message = "Cold!"
            color =  .cyan
        } else if counter >= -10 {
            message = "It's freezing!!"
            color = .blue
        } else if counter < -15 {
            message = "Turn it up! I'll freeze to death."
            counter = 20
            color = .yellow
        }
    }
    
    
    var body: some View {
        
        ZStack {
            //for background
            VStack {
                Spacer()
                Text("\(Int(counter))")
                    .font(.system(size: 20))
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                //most components
                ZStack { //weird spacers to make the thermometer 'grow' from the ground
                    VStack {
                        
                        
                        //top of thermo thing
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .offset(y: 30)
                        
                        Rectangle()
                            .frame(width: 20, height: 500)
                        Circle()
                            .frame(width: 20, height: 20, alignment: .center)
                            .offset(y: -15)
                    }
                    
                    VStack (alignment:.trailing) {
                        Spacer()
                        Rectangle()
                            .offset(y: -15)
                            .foregroundColor(.red)
                            .frame(width: 10, height: (counter + 15.0) * 7)
                        
                    }
                    
                }
                
                
                
                HStack {
                    Button {
                        print(counter)
                        withAnimation {
                            counter += 5
                            checkTemp()
                            
                        }
                        
                    } label: {
                        Text("Warmer")
                            .padding()
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    
                    Button {
                        print("")
                        withAnimation{
                            counter -= 5
                            checkTemp()
                        }
                        
                    } label: {
                        Text("Colder")
                            .padding()
                            .background(.teal)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                }
                
                
                Text(message)
                    .padding()
                
                
            }
            
            Rectangle()
                .foregroundColor(color)
                .ignoresSafeArea()
                .zIndex(-2.0)
                .opacity(0.8)
        }
        
        
        
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
