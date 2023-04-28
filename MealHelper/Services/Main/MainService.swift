//
//  MainService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol IMainService: AnyObject {
    func getEasy() -> Category
    func getNew() -> Category
    func getPopular() -> Category
    func getData() -> [Category]
}
final class MainService: IMainService {
    func getPopular() -> Category {
        return Category.popular([RecipeModel]())
    }
    func getNew() -> Category {
        return Category.new([RecipeModel]())
    }
    func getEasy() -> Category {
        return Category.easy([RecipeModel]())
    }
    func getData() -> [Category] {
        return []
    }
}

final class MockMainService: IMainService {
    let popular: Category = {
        .popular([
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ), RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
        ])
    }()
    let new: Category = {
        .new([
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"]),
            RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            ,RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            ,RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            ,RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
        ])
    }()
    let easy: Category = {
        .easy([
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ),
            RecipeModel(
                title: "Chicken Al Pastor",
                description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
                image: "testImage",
                creator: "SomeBody",
                timeToCook: 25,
                timeToPrepare: 10,
                kcal: 318,
                fat: 13,
                saturates: 6,
                protein: 13,
                ingredients: [
                    "1 tbsp olive oil",
                    "1 onion, finely chopped",
                    "2 garlic cloves, crushed",
                    "120g chorizo, diced",
                    "2 x 400g cans chopped tomatoes",
                    "1 tsp caster sugar",
                    "600g fresh gnocchi",
                    "125g mozzarella ball, cut into chunks",
                    "small bunch of basil, torn",
                    "green salad, to serve"
                ],
                method: [
                    "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
                    "Stir ¾ of the mozzarella and most of the basil thr"
                ]
            ), RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
            , RecipeModel(title: "", description: "", image: "testImage", creator: "", timeToCook: 1, timeToPrepare: 1, kcal: 1, fat: 1, saturates: 1, protein: 1, ingredients: ["",""], method: ["s"])
        ])
    }()
    func getPopular() -> Category {
        return popular
    }
    func getNew() -> Category {
        return new
    }
    func getEasy() -> Category {
        return easy
    }
    func getData() -> [Category] {
        return [popular, new, easy]
    }
}
