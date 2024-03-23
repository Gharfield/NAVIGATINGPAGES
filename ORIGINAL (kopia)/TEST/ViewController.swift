import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let recipeViewController = RecipeViewController(coder: NSCoder()) {
            recipeViewController.modalPresentationStyle = .fullScreen
            present(recipeViewController, animated: true, completion: nil)
        }
    }
}

class RecipeViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    let numberOfPages = 10
    var currentPageIndex = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Custom initialization code if needed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        setViewControllers(getPageViewControllers(index: currentPageIndex), direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.pageIndex, index > 0 else {
            return nil
        }
        return getPageViewController(index: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = (viewController as? PageViewController)?.pageIndex, index < numberOfPages - 1 else {
            return nil
        }
        return getPageViewController(index: index + 1)
    }
    
    func getPageViewControllers(index: Int) -> [UIViewController] {
        let pageViewController = getPageViewController(index: index)
        return [pageViewController]
    }
    
    func getPageViewController(index: Int) -> UIViewController {
        switch index {
        case 0:
            return Page1ViewController(pageIndex: index)
        case 1:
            return Page3ViewController(pageIndex: index) // Skipping Page2ViewController
        // Add more cases for other pages as needed
        default:
            return UIViewController()
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first as? PageViewController {
                currentPageIndex = currentViewController.pageIndex
            }
        }
    }
}

protocol PageViewController {
    var pageIndex: Int { get set }
}

