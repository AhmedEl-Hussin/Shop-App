
import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

struct Products {
    var uniqId : Int
    var image : String
    var title : String
    var price : Double
}


struct HomeScreenView: View {
    
    let Categories = ["All" , "Chair" , "Sofa" , "Lamp" , "Kitchen" , "Table" ]
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                
                Color(hex: 0xedeaea)
                    .ignoresSafeArea()
                
                ScrollView(.vertical){
                    
                    VStack(alignment: .leading){
                        
                        AppBarView()
                        
                        HeaderTitle()
                            .padding(.top)
                        
                        SearchInput()
                        
                        ScrollView (.horizontal , showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(0 ..< Categories.count){
                                    category in
                                    
                                    Text(Categories[category])
                                        .padding(9)
                                        .foregroundColor(Color(hex: 0xad7b2b))
                                    
                                }
                            }
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                            .padding(.top)
                                        
                        ProductList()
                        
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                            .padding(.top)
                                        
                        ProductList()
                        
                        
                    }.padding()

                }

                ButtonNavBarItem()
                        
            }

            
        }
        
    }
    
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


struct AppBarView: View {
    var body: some View{
        
        HStack{
            
            Button(action:{}){
                
                Image("menu")
                    .padding(6)
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Image("Ahmed")
                .resizable()
                .frame(width: 55 , height: 53)
                .cornerRadius(10.0)
            
        }
        
    }
}

struct HeaderTitle: View {
    var body: some View{
        
        Text("Find the \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 30))
            .foregroundColor(Color(hex: 0xad7b2b))
        
        + Text(" Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 30))
            .foregroundColor(Color(hex: 0xad7b2b))
        
    }
}

struct SearchInput: View {
    @State private var SearchName: String = ""

    var body: some View{
        
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Search Furniture", text: $SearchName)
                
        }
        .padding(15)
        .background(Color(.white))
        .cornerRadius(10.0)
        .padding(.trailing)
        
    }
}

struct ProductList: View {
    
    let products = [
        
        Products(uniqId: 1, image: "image1", title: "Luxury Swedian Chair", price: 1243),
        Products(uniqId: 2, image: "image2", title: "cairo alharm table", price: 543),
        Products(uniqId: 3, image: "image3", title: "fayuom giza Chair", price: 1300),
        Products(uniqId: 4, image: "image4", title: "Luxury Swedian Chair", price: 7654),
        Products(uniqId: 5, image: "image5", title: "aswain helaa Chair", price: 8888),
        Products(uniqId: 6, image: "image6", title: "Luxury Swedian Chair", price: 1243),

    ]

    var body: some View{
        
        ScrollView(.horizontal , showsIndicators: false){
            
            HStack{
                
                ForEach(products , id: \.uniqId){
                    product in
                    
                    NavigationLink(destination: ProductDetailsView()){
                        
                        VStack(alignment: .leading){
                            Image(product.image)
                                .resizable()
                                .frame(width: 215 , height: 180)
                                .cornerRadius(15.0)
                            
                            Text(product.title)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            HStack(spacing: 2){
                                
                                ForEach(0 ..< 5){ i in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                }
                                
                                Spacer()
                                
                                Text("$\(product.price , specifier: "%.1f")")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                
                            }.padding(.top , 5)

                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15.0)
                        
                        
                    }
                    .navigationBarHidden(true)
                    .foregroundColor(.black)

                    
                }
                
            }
            
        }
        
    }
}

struct ButtonNavBarItem: View {
    
    var body: some View{
     
        HStack{
            
            Button(action: {}){
                Image(systemName: "house")
                    .foregroundColor(Color(hex: 0xad7b2b))
                    .font(.system(size: 30))
//                        .padding()
                    .frame(maxWidth: .infinity)

            }
            
            Button(action: {}){
                Image(systemName: "heart")
                    .foregroundColor(Color(hex: 0xad7b2b))
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
            }
            
            Button(action: {}){
                Image(systemName: "cart")
                    .foregroundColor(Color(hex: 0xad7b2b))
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)

            }
            
            Button(action: {}){
                Image(systemName: "person")
                    .foregroundColor(Color(hex: 0xad7b2b))
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)

            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .frame(maxHeight: .infinity , alignment: .bottom)
    }
}

