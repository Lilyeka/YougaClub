//
//  HorisontalScrollingImages.swift
//  YogaClub
//
//  Created by Лилия Левина on 15.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import UIKit
import SafariServices

class HorisontalScrollingImg: UIViewController, SFSafariViewControllerDelegate {
    
    var dayOfWeek: String = ""
    var Foods = [Food]()
    
    final class DeluxeView: UIView {
        func handleDeluxeButtonTap() {
            print("Deluxe View Action")
        }
    }
    
    var myScrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        return scrollV
    }()

    let dimensions = (width: 100, height: 100)
    
    var myStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.backgroundColor = .black
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.axis = .horizontal
        stackV.alignment = .fill
        stackV.distribution = .equalSpacing
        stackV.spacing = 10.0
        return stackV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        
        var dimentions = ["Система", "Кристаллические эссенции", "Кристаллы", "Ароматы", "Энергетические формулы", "Бальзамы", "Тело", "Частота (Hz)", "Вкусы", "Триграмма", "Геометрия"]
        var daysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
        
        let food1 = Food(name: "Усечённое тело", dimention: "Тело", dayOfWeek: daysOfWeek[0], url: "http://www.olegcherne.ru/proekty/11-248-usechenoe-telo/")
        let food2 = Food(name: "Репродуктивная", dimention: "Система", dayOfWeek: daysOfWeek[0], url: "")
        let food3 = Food(name: "Амен F-500", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[0], url:"http://www.olegcherne.ru/product/60-formula500/")
        let food4 = Food(name: "B-500", dimention: "Бальзамы", dayOfWeek: daysOfWeek[0],url: "")
        let food5 = Food(name: "Эссенция 5000, Nutri-Q 5000",dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[0],url: "")
        let food6 = Food(name: "Ладан, Османтус, Мирра", dimention: "Ароматы", dayOfWeek: daysOfWeek[0], url:"http://www.olegcherne.ru/proekty/11-365-maslo-ladana/")
        let food7 = Food(name: "Серебро, Магнезит, Янтарь, Лунный камень", dimention: "Кристаллы", dayOfWeek: daysOfWeek[0], url: "")
        let food8 = Food(name: "< 10", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[0], url: "")
        let food9 = Food(name: "Смешанный", dimention: "Вкусы", dayOfWeek: daysOfWeek[0], url: "")
        let food10 = Food(name: "Чжень, Дуй", dimention: "Триграмма", dayOfWeek: daysOfWeek[0], url: "")
        let food11 = Food(name: "Тело Луны(усеченная пирамида)", dimention: "Геометрия", dayOfWeek: daysOfWeek[0], url: "")
        
        let food12 = Food(name: "Тело объёма", dimention: "Тело", dayOfWeek: daysOfWeek[1],url: "http://www.olegcherne.ru/proekty/11-242-telo-obyema/")
        let food13 = Food(name: "Кровь", dimention: "Система", dayOfWeek: daysOfWeek[1], url: "http://www.olegcherne.ru/statyi/68-krov/")
        let food14 = Food(name: "Кхорн F-200", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[1], url: "http://www.olegcherne.ru/post-ru/148-pitanie-krovi200/")
        let food15 = Food(name: "B-200", dimention: "Бальзамы", dayOfWeek: daysOfWeek[1], url: "")
        let food16 = Food(name: "Эссенция 2000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[1], url: "")
        let food17 = Food(name: "Манука, Имбирь, Кардамон", dimention: "Ароматы", dayOfWeek: daysOfWeek[1], url:"http://www.olegcherne.ru/proekty/11-219-aromat-manuka/")
        let food18 = Food(name: "Аметист, Сердолик, Винный камень", dimention: "Кристаллы", dayOfWeek: daysOfWeek[1], url:"http://www.olegcherne.ru/proekty/11-346-amethyst/")
        let food19 = Food(name: "8-15", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[1], url: "")
        let food20 = Food(name: "Горький", dimention: "Вкусы", dayOfWeek: daysOfWeek[1], url: "")
        let food21 = Food(name: "Ли", dimention: "Триграмма", dayOfWeek: daysOfWeek[1], url: "")
        let food22 = Food(name: "Тело Марса (куб)", dimention: "Геометрия", dayOfWeek: daysOfWeek[1], url: "")
        
        let food23 = Food(name: "Тело напряжения", dimention: "Тело", dayOfWeek: daysOfWeek[2], url:"http://www.olegcherne.ru/proekty/11-243-telo-napryazheniya/")
        let food24 = Food(name: "Кости", dimention: "Система", dayOfWeek: daysOfWeek[2], url: "")
        let food25 = Food(name: "Дунатис F-300", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[2], url:"http://www.olegcherne.ru/product/67-pitanie-kostej300/")
        let food26 = Food(name: "В-300", dimention: "Бальзамы", dayOfWeek: daysOfWeek[2], url: "")
        let food27 = Food(name: "Эссенция 3000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[2], url: "")
        let food28 = Food(name: "Чёрный перец, Мята перечная", dimention: "Ароматы", dayOfWeek: daysOfWeek[2], url:"http://www.olegcherne.ru/proekty/11-410-maslo-chernogo-perca/")
        let food29 = Food(name: "Цитрин, Жемчуг, Турмалин", dimention: "Кристаллы", dayOfWeek: daysOfWeek[2], url:"http://www.olegcherne.ru/proekty/11-335-citrine/")
        let food30 = Food(name: "10-90", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[2], url: "")
        let food31 = Food(name: "Солёный", dimention: "Вкусы", dayOfWeek: daysOfWeek[2], url: "")
        let food32 = Food(name: "Кань", dimention: "Триграмма", dayOfWeek: daysOfWeek[2], url: "")
        let food33 = Food(name: "Тело Меркурия(тетрагональная усечённая пирамида)", dimention: "Геометрия", dayOfWeek: daysOfWeek[2], url: "")
        
        let food34 = Food(name: "Тело вращения", dimention: "Тело", dayOfWeek: daysOfWeek[3], url: "http://www.olegcherne.ru/proekty/11-244-telo-vracheniya/")
        let food35 = Food(name: "Мышцы", dimention: "Система", dayOfWeek: daysOfWeek[3], url:"http://www.olegcherne.ru/statyi/109-myshechnaya-sistema/")
        let food36 = Food(name: "Геркулес, F-400, F-100", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[3], url:"http://www.olegcherne.ru/post-ru/154-formula400/")
        let food37 = Food(name: "B-400", dimention: "Бальзамы", dayOfWeek: daysOfWeek[3], url: "")
        let food38 = Food(name: "Эссенция 4000, Nutri-Q 4000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[3], url: "")
        let food39 = Food(name: "Пачули, Какао", dimention: "Ароматы", dayOfWeek: daysOfWeek[3], url: "")
        let food40 = Food(name: "Изумруд, Тигровое железо, Медь, Рубин", dimention: "Кристаллы", dayOfWeek: daysOfWeek[3], url:"http://www.olegcherne.ru/proekty/11-218-izumrud/")
        let food41 = Food(name: "8-40", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[3], url: "")
        let food42 = Food(name: "Кислый", dimention: "Вкусы", dayOfWeek: daysOfWeek[3], url: "")
        let food43 = Food(name: "Сунь", dimention: "Триграмма", dayOfWeek: daysOfWeek[3], url: "")
        let food44 = Food(name: "Тело Юпитера (гексагональная пирамида)", dimention: "Геометрия", dayOfWeek: daysOfWeek[3], url: "")
        
        let food45 = Food(name: "Тело натяжения", dimention: "Тело", dayOfWeek: daysOfWeek[4], url: "http://www.olegcherne.ru/proekty/11-247-telo-natyazheniya/")
        let food46 = Food(name: "Кожа", dimention: "Система", dayOfWeek: daysOfWeek[4], url: "http://www.olegcherne.ru/statyi/103-kozhnaya-sistema/")
        let food47 = Food(name: "Борей F-700", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[4], url:"http://www.olegcherne.ru/post-ru/152-formula700/")
        let food48 = Food(name: "B-700", dimention: "Бальзамы", dayOfWeek: daysOfWeek[4], url: "")
        let food49 = Food(name: "Эссенция 7000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[4], url: "")
        let food50 = Food(name: "Анис, Эвкалипт", dimention: "Ароматы", dayOfWeek: daysOfWeek[4], url: "")
        let food51 = Food(name: "Халцедон, Горный хрусталь", dimention: "Кристаллы", dayOfWeek: daysOfWeek[4], url:"http://www.olegcherne.ru/statyi/136-halcedon/")
        let food52 = Food(name: "20-260", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[4], url: "")
        let food53 = Food(name: "Острый", dimention: "Вкусы", dayOfWeek: daysOfWeek[4], url: "")
        let food54 = Food(name: "Гэнь", dimention: "Триграмма", dayOfWeek: daysOfWeek[4], url: "")
        let food55 = Food(name: "Тело Венеры (ромбоэдр)", dimention: "Геометрия", dayOfWeek: daysOfWeek[4], url: "")
        
        let food56 = Food(name: "Тело собирания", dimention: "Тело", dayOfWeek: daysOfWeek[5], url: "http://www.olegcherne.ru/proekty/11-245-telo-sobiraniya/")
        let food57 = Food(name: "Сухожилия", dimention: "Система", dayOfWeek: daysOfWeek[5], url:"")
        let food58 = Food(name: "Ахил F-600", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[5], url:"http://www.olegcherne.ru/product/68-pitanie-suhozhilij600/")
        let food59 = Food(name: "B-600", dimention: "Бальзамы", dayOfWeek: daysOfWeek[5], url: "")
        let food60 = Food(name: "Эссенция 6000, Nutri-Q 6000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[5], url: "")
        let food61 = Food(name: "Бензоин, Корица, Пчёльные соты", dimention: "Ароматы", dayOfWeek: daysOfWeek[5], url:"http://www.olegcherne.ru/proekty/11-141-benzoin/")
        let food62 = Food(name: "Клиноптилолит, Красная яшма, Сардоникс", dimention: "Кристаллы", dayOfWeek: daysOfWeek[5], url:"http://www.olegcherne.ru/proekty/11-104-klinoptilolith/")
        let food63 = Food(name: "3,3-5,2", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[5], url: "")
        let food64 = Food(name: "Сладкий", dimention: "Вкусы", dayOfWeek: daysOfWeek[5], url: "")
        let food65 = Food(name: "Кунь", dimention: "Триграмма", dayOfWeek: daysOfWeek[5], url: "")
        let food66 = Food(name: "Тело Сатурна (призма)", dimention: "Геометрия", dayOfWeek: daysOfWeek[5], url: "")
        
        let food67 = Food(name: "Резонансное тело", dimention: "Тело", dayOfWeek: daysOfWeek[6], url: "http://www.olegcherne.ru/proekty/11-246-resonansnoe-telo/")
        let food68 = Food(name: "Мозг", dimention: "Система", dayOfWeek: daysOfWeek[6], url:"")
        let food69 = Food(name: "Аристотель  F-900", dimention: "Энергетические формулы", dayOfWeek: daysOfWeek[6], url:"http://www.olegcherne.ru/post-ru/224-pitanie-mozga900/")
        let food70 = Food(name: "B-900", dimention: "Бальзамы", dayOfWeek: daysOfWeek[6], url: "")
        let food71 = Food(name: "Эссенция 9000", dimention: "Кристаллические эссенции", dayOfWeek: daysOfWeek[6], url: "")
        let food72 = Food(name: "Бобы тонка, Бессмертник, Медовые соты", dimention: "Ароматы", dayOfWeek: daysOfWeek[6], url:"http://www.olegcherne.ru/proekty/11-134-dipteryx-odorata/")
        let food73 = Food(name: "Содалит, Золото, Алмаз", dimention: "Кристаллы", dayOfWeek: daysOfWeek[6], url:"http://www.olegcherne.ru/proekty/11-280-sodalit/")
        let food74 = Food(name: "Все частоты", dimention: "Частота (Hz)", dayOfWeek: daysOfWeek[6], url: "")
        let food75 = Food(name: "Смешанный", dimention: "Вкусы", dayOfWeek: daysOfWeek[6], url: "")
        let food76 = Food(name: "Цянь", dimention: "Триграмма", dayOfWeek: daysOfWeek[6], url: "")
        let food77 = Food(name: "Тело Солнца (сфера)", dimention: "Геометрия", dayOfWeek: daysOfWeek[6], url: "")
        
        let foods = [food1, food2, food3, food4, food5, food6, food7, food8, food9, food10, food11, food12, food13, food14, food15, food16, food17, food18, food19, food20, food21, food22, food23, food24, food25, food26, food27, food28, food29, food30, food31, food32, food33, food34, food35, food36, food37, food38, food39, food40, food41, food42, food43, food44, food45, food46, food47, food48, food49, food50, food51, food52, food53, food54, food55, food56, food57, food58, food59, food60, food61, food62, food63, food64, food65, food66, food67, food68, food69, food70, food71, food72, food73, food74, food75, food76, food77]
        
        let buttonRect = CGRect(x: dimensions.width/2, y: dimensions.height/2, width: dimensions.width,height: dimensions.height)
        var deluxeButtons = [DeluxeButton]()
        
        for i in 0...dimentions.count-1 {
            let btn = DeluxeButton(frame: buttonRect)
            let food = getFood(arrayOfFood: foods, dayOfWeek: dayOfWeek, dimension: dimentions[i])
            btn.backgroundColor = UIColor(colorLiteralRed: 249.0/255, green: 239.0/255, blue: 174.0/255, alpha: 1.0)//#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            btn.tintColor = UIColor(colorLiteralRed: 229.0/255, green: 217.0/255, blue: 185.0/255, alpha: 1.0)//#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            btn.borderWidth = 3
            btn.text = food.name
            btn.textTop = dimentions[i]
            btn.btnUrlName = food.url
            btn.addTarget(self, action: #selector(handleTapDeluxeButton), for: .touchUpInside)
            deluxeButtons.append(btn)
            myStackView.addArrangedSubview(btn)
       }

        myScrollView.addSubview(myStackView)
        view.addSubview(myScrollView)
        
        myScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        myStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor).isActive = true
        myStackView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor).isActive = true
        myStackView.rightAnchor.constraint(equalTo: myScrollView.rightAnchor).isActive = true
        myStackView.leftAnchor.constraint(equalTo: myScrollView.leftAnchor).isActive = true
        
        myScrollView.heightAnchor.constraint(equalTo: myStackView.heightAnchor).isActive = true
        
        for i in 0...deluxeButtons.count-1 {
            if i == 0 {
                deluxeButtons[i].leftAnchor.constraint(equalTo: myScrollView.leftAnchor, constant: 5).isActive = true
                deluxeButtons[i].bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor, constant: -10).isActive = true
                deluxeButtons[i].topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 10).isActive = true
            }
            if i == deluxeButtons.count-1 {
                deluxeButtons[i].rightAnchor.constraint(equalTo: myScrollView.rightAnchor, constant: -5).isActive = true
            }
            deluxeButtons[i].widthAnchor.constraint(equalTo:myScrollView.widthAnchor, multiplier: 1/3, constant: -(5+10+10+5)/3).isActive = true
        }
        
    }
    
    func handleTapDeluxeButton(sender: DeluxeButton){
        if let btnUrl = sender.btnUrlName {
            if let url = URL(string: btnUrl){
               /* if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }*/
                let svc = SFSafariViewController(url: url)
                svc.delegate = self
                self.present(svc, animated: true, completion: nil)
            }
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myScrollView.contentSize = myStackView.bounds.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFood(arrayOfFood: [Food], dayOfWeek: String, dimension: String) -> Food{
        var result: Food = Food(name: "", dimention: "", dayOfWeek: "", url: "")
        for i in 0...arrayOfFood.count - 1{
            let currentElement = arrayOfFood[i]
            if currentElement.dayOfWeek == dayOfWeek && currentElement.dimention == dimension {
                result = currentElement
           }
        }
        return result
    }
}
