//
//  Model.swift
//  UiITableTest
//
//  Created by Eugene Krapivenko on 16.03.2022.
//

import Foundation

// MARK: - Discription of models
protocol Goods {
    var name: String { get set }
    var discription: String { get set }
    var price: Int { get set }
}

protocol Store {
    func getList(_ : @escaping ((_ result: [Goods], _ error: Error?) -> ()))
}

// MARK: - Implementation
struct SomeProduct : Goods {
    var name: String
    var discription: String
    var price: Int
}

final class SomeShop: Store {
    typealias action = ((_ result: [Goods] , _ error: Error?) -> ())
    
    func getList(_ completon: @escaping action) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3) {
            let result = [
                SomeProduct(
                    name: "Vitae Aliquam Associates",
                    discription: "elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc.",
                    price: 37),
                SomeProduct(
                    name: "Suspendisse Eleifend Cras Associates",
                    discription: "sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit",
                    price: 28),
                SomeProduct(
                    name: "Magna Limited",
                    discription: "euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at",
                    price: 43),
                SomeProduct(
                    name: "Nunc Sed LLP",
                    discription: "tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero.",
                    price: 66),
                SomeProduct(
                    name: "Cursus Vestibulum Limited",
                    discription: "Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et,",
                    price: 47),
                SomeProduct(
                    name: "Justo Sit Industries",
                    discription: "eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero",
                    price: 54),
                SomeProduct(
                    name: "Nisi LLC",
                    discription: "tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean",
                    price: 27),
                SomeProduct(
                    name: "Vivamus Nibh Corp.",
                    discription: "et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet",
                    price: 55),
                SomeProduct(
                    name: "Odio Incorporated",
                    discription: "ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris",
                    price: 77),
                SomeProduct(
                    name: "Et Nunc Quisque Inc.",
                    discription: "diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur",
                    price: 41),
            ]
            completon(result, nil)
        }
    }
}

