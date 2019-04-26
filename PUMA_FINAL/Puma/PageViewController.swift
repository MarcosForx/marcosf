//
//  PageViewController.swift
//  Puma
//
//  Created by Andres Lopez on 11/9/18.
//  Copyright © 2018 Andres Lopez. All rights reserved.
//

//FUENTE DEL CÓDIGO: https://www.youtube.com/watch?v=RVAtqQ8CyKM

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate,
UIPageViewControllerDataSource{
    
    /*¿Qué es una lazy var?, ¿por qué se ponen () al final?*/
    lazy var  orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "PageOne"),
                self.newVc(viewController: "PageTwo")]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        /*
         ¿Qué es guard?
         */
        
        //¿Qué hace esta instrucción?
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
            //¿Qué quiere decir el .first?
            return orderedViewControllers.first
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward,
                animated: true,
                completion: nil)
        }
    }
    
    func newVc(viewController : String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
