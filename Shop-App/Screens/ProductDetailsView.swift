//
//  ProductDetailsView.swift
//  Shop-App
//
//  Created by Ahmed Elhussin on 02/04/2024.
//

import SwiftUI


struct ProductDetailsView: View {
    var body: some View {
        
        ZStack{
            
            Color(hex: 0xedeaea)
                .ignoresSafeArea()
            

            ScrollView (.vertical){
                
                VStack{
                    
                    Image("image4")
                        .resizable()
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 350)
                    
                    //                    Spacer()
                    
                    ProductInfo()
                        .offset(y: -20)
                    
                }
            }
            
            HStack{
                
                Text("$1299")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                
                Spacer()
                
                Button(action: {}){
                    
                    Text("Add to cart ")
                        .padding()
//                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: 0xad7b2b))
                        .fontWeight(.bold)
                }
  
            }
            .padding()
            .background(Color(hex: 0xad7b2b))
            .frame(maxHeight: .infinity , alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
            
        }
        
  
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}


struct ProductInfo: View {
    var body: some View{
     
        VStack (alignment: .leading){
            
            Text("Luruxy Swedia \nChair")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            
            HStack(spacing: 2){
                
                ForEach(0 ..< 5) { i in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
                
                
                Text("(4.9)")
                    .padding(.leading )
                    
            }.padding(.top , 5)

            Text("Descripton")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.top , 10)
            
            Text("Luxury Swedain Chair is a contemporary chair \nbased on the virtues of modern craft. it carries \non the simplicity and honestly of the \narchetypical chair. ")
            
                .font(.system(size: 17))
                .opacity(0.6)
                .padding(.top , 10)
                .lineSpacing(6)
            
            HStack{
                
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.bold)
                    
                    Text("Height: 120cm \nWide: 80 cm \nDiameter: 72 cm")
                        .opacity(0.5)
                }
                                
                VStack(alignment: .leading , spacing: 5){
                    Text("Treatment")
                        .fontWeight(.bold)
                    
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.5)
                    
                }.padding(.leading , 50)
                
            }.padding(.top)
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Text("Colors")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    HStack{
                        
                        Circle()
                            .fill(Color(hex: 0xad7b2b))
                            .frame(width: 25)
                        
                        Circle()
                            .fill(Color.black)
                            .frame(width: 25)
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 25)

                    }
                    
                }
                
                Spacer()
                
                HStack{
                    
                    Button(action: {}){
                        Image(systemName: "minus")
                            .padding(.all , 8)
                    }
                    .frame(width: 30 , height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                    .foregroundColor(Color.black)
                    
                    Text("1")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Button(action: {}){
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .padding(.all , 8)
                    }
                    .frame(width: 32 , height: 32)
                    .background(Color(hex: 0xad7b2b))
                    .cornerRadius(50)
                    
                }
                
            }.padding(.top)
            
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25.0)
        
    }
}
