//
//  AppPresentationAssembly.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import Foundation

protocol IAppPresentationAssembly: AnyObject {
    // Coordinators
    var authCoordinator: IAuthCoordinator { get }
    var loginCoordinator: ILoginCoordinator { get }
    var forgotPasswordCoordinator: IForgotPasswordCoordinator { get }
    var createAccountCoordinator: ICreateAccountCoordinator { get }
    var mainTabBarCoordinator: IMainTabBarCoordinator { get }
    var mainCoordinator: IMainCoordinator { get }
    var likesCoordinator: ILikesCoordinator { get }
    var yourRecipesCoordinator: IYourRecipesCoordinator { get }
    var settingsCoordinator: ISettingsCoordinator { get }
    var recipeCoordinator: IRecipeCoordinator { get }
    var createRecipeCoordinator: ICreateRecipeCoordinator { get }
    var categoryCoordinator: ICategoryCoordinator { get }
    // ModuleBuilders
    var startModuleBuilder: IAuthModuleBuilder { get }
    var loginModuleBuilder: ILoginModuleBuilder { get }
    var forgotModuleBuilder: IForgotPasswordModuleBuilder { get }
    var createAccountModuleBuilder: ICreateAccountModuleBuilder { get }
    var mainMuduleBuilder: IMainModuleBuilder { get }
    var likesModuleBuilder: ILikesModuleBuilder { get }
    var yourRecipesModuleBuilder: IYourRecipesModuleBuilder { get }
    var settingsModuleBuilder: ISettingsModuleBuilder { get }
    var recipeModuleBuilder: IRecipeModuleBuilder { get }
    var createRecipeModuleBuilder: ICreateRecipeModuleBuilder { get }
    var categoryModuleBuilder: ICategoryModuleBuilder { get }
}

final class AppPresentationAssembly: IAppPresentationAssembly {
    // Dependencies
    private let servicesAssembly: IAppServicesAssembly
    
    // MARK: Init
    
    init(servicesAssembly: IAppServicesAssembly) {
        self.servicesAssembly = servicesAssembly
    }
    
    // MARK: Coordinators
        
    var authCoordinator: IAuthCoordinator {
        AuthCoordinator(
            moduleBuilder: startModuleBuilder,
            loginCoordinator: loginCoordinator,
            createAccountCoordinator: createAccountCoordinator,
            mainTabBarCoordinator: mainTabBarCoordinator
        )
    }
    
    var loginCoordinator: ILoginCoordinator {
        LoginCoordinator(
            moduleBuilder: loginModuleBuilder,
            forgotPasswordCoordinator: forgotPasswordCoordinator,
            mainTabBarCoordinator: mainTabBarCoordinator
        )
    }
    
    var forgotPasswordCoordinator: IForgotPasswordCoordinator {
        ForgotPasswordCoordinator(moduleBuilder: forgotModuleBuilder)
    }
    
    var createAccountCoordinator: ICreateAccountCoordinator {
        CreateAccountCoordinator(
            moduleBuilder: createAccountModuleBuilder,
            mainTabBarCoordinator: mainTabBarCoordinator
        )
    }
    
    var mainTabBarCoordinator: IMainTabBarCoordinator {
        MainTabBarCoordinator(
            mainCoordinator: mainCoordinator,
            likesCoordinator: likesCoordinator,
            yourRecipesCoordinator: yourRecipesCoordinator,
            settignsCoordinator: settingsCoordinator
        )
    }
    
    var recipeCoordinator: IRecipeCoordinator {
        RecipeCoordinator(moduleBuilder: recipeModuleBuilder)
    }
    
    var mainCoordinator: IMainCoordinator {
        MainCoordinator(
            moduleBuilder: mainMuduleBuilder,
            reicpeCoordinator: recipeCoordinator,
            categoryCoordinator: categoryCoordinator
        )
    }
    
    var likesCoordinator: ILikesCoordinator {
        LikesCoordinator(
            moduleBuilder: likesModuleBuilder,
            recipeCoordinator: recipeCoordinator
        )
    }
    
    var yourRecipesCoordinator: IYourRecipesCoordinator {
        YourRecipesCoordinator(
            moduleBuilder: yourRecipesModuleBuilder,
            createRecipeCoordinator: createRecipeCoordinator,
            recipeCoordinator: recipeCoordinator
        )
    }
    
    var settingsCoordinator: ISettingsCoordinator {
        SettingsCoordinator(moduleBuilder: settingsModuleBuilder)
    }
    
    var createRecipeCoordinator: ICreateRecipeCoordinator {
        CreateRecipeCoordinator(moduleBuilder: createRecipeModuleBuilder)
    }
    
    var categoryCoordinator: ICategoryCoordinator {
        CategoryCoordinator(moduleBuilder: categoryModuleBuilder, recipeCoordinator: recipeCoordinator)
    }
    // MARK: ModuleBuilders
    
    var startModuleBuilder: IAuthModuleBuilder {
        AuthModuleBuilder(authService: servicesAssembly.authService)
    }
    
    var loginModuleBuilder: ILoginModuleBuilder {
        LoginModuleBuilder(loginService: servicesAssembly.loginService)
    }
    
    var forgotModuleBuilder: IForgotPasswordModuleBuilder {
        ForgotPasswordModuleBuilder(forgotPasswordService: servicesAssembly.forgotPasswordService)
    }
    
    var createAccountModuleBuilder: ICreateAccountModuleBuilder {
        CreateAccountModuleBuilder(createAccountService: servicesAssembly.createAccountService)
    }
    
    var mainMuduleBuilder: IMainModuleBuilder {
        MainModuleBuilder(mainService: servicesAssembly.mainService)
    }
    
    var likesModuleBuilder: ILikesModuleBuilder {
        LikesModuleBuilder(likesService: servicesAssembly.likesService)
    }
    
    var yourRecipesModuleBuilder: IYourRecipesModuleBuilder {
        YourRecipesModuleBuilder(yourRecipesService: servicesAssembly.yourRecipesService)
    }
    
    var settingsModuleBuilder: ISettingsModuleBuilder {
        SettingsModuleBuilder(settingsService: servicesAssembly.settingsService)
    }
    
    var recipeModuleBuilder: IRecipeModuleBuilder {
        RecipeModuleBuilder(recipeService: servicesAssembly.recipeService)
    }
    
    var createRecipeModuleBuilder: ICreateRecipeModuleBuilder {
        CreateRecipeModulebuilder(createRecipeService: servicesAssembly.createRecipeSerivce)
    }
    
    var categoryModuleBuilder: ICategoryModuleBuilder {
        CategoryModuleBuilder(categoryService: servicesAssembly.categorySerivce)
    }
}
