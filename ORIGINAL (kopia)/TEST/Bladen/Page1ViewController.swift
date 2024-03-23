// FÖRSTA MAIN SCREEN
import UIKit

protocol PageViewControllerDelegate: AnyObject {
    func pageViewControllerDidDismiss()
}

class Page1ViewController: UIViewController, PageViewController {
    var pageIndex: Int
    private var sheetCount = 1
    weak var delegate: PageViewControllerDelegate?

    init(pageIndex: Int) {
        self.pageIndex = pageIndex
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor(red: 220/255, green: 205/255, blue: 185/255, alpha: 1.0)
        view.addSubview(scrollView)

        // Set up constraints to fill the scroll view to the whole screen
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Create an image view with the background image
        let backgroundImageView = UIImageView(image: UIImage(named: "1"))
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleToFill
        scrollView.addSubview(backgroundImageView)

        // Set up constraints to position and size the image view inside the scroll view
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        // Create the content view that holds the sheets
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // Set up constraints to position and size the content view inside the scroll view
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Add sheets to the content view
        for index in 0..<sheetCount {
            let sheetView = createSheetView(withIndex: index, text: "FARMOR", fontName: "Kefa-Regular", fontSize: 85)
            contentView.addSubview(sheetView)

            // Set up constraints to position the sheet views horizontally inside the content view
            NSLayoutConstraint.activate([
                sheetView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: view.bounds.width * CGFloat(index)),
                sheetView.topAnchor.constraint(equalTo: contentView.topAnchor),
                sheetView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                sheetView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
        }

        // Add swipe gesture recognizer to scroll between sheets
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .left
        scrollView.addGestureRecognizer(swipeGesture)
    }

    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            let nextPageIndex = sheetCount + 1
            let nextPageViewController = Page1ViewController(pageIndex: nextPageIndex)
            nextPageViewController.modalPresentationStyle = .fullScreen
            nextPageViewController.delegate = self // Set the delegate

            present(nextPageViewController, animated: true, completion: nil)
        }
    }

    func createSheetView(withIndex index: Int, text: String, fontName: String, fontSize: CGFloat) -> UIView {
        let sheetView = UIView()
        sheetView.backgroundColor = .clear
        sheetView.translatesAutoresizingMaskIntoConstraints = false

        // Create a label to display the "FARMOR" text
        let farmorLabel = UILabel()
        farmorLabel.text = text
        farmorLabel.font = UIFont(name: fontName, size: fontSize)
        farmorLabel.textAlignment = .center
        farmorLabel.textColor = .white // Set the text color to white
        farmorLabel.translatesAutoresizingMaskIntoConstraints = false
        sheetView.addSubview(farmorLabel)

        // Set up constraints to position the "FARMOR" label
        NSLayoutConstraint.activate([
            farmorLabel.leadingAnchor.constraint(equalTo: sheetView.leadingAnchor, constant: 16),
            farmorLabel.topAnchor.constraint(equalTo: sheetView.topAnchor, constant: 157),
            farmorLabel.widthAnchor.constraint(equalToConstant: 384),
            farmorLabel.heightAnchor.constraint(equalToConstant: 159)
        ])

        // Create a label to display the "FARFAR" text below the "FARMOR" label
        let farfarLabel = UILabel()
        farfarLabel.text = "FARFAR"
        farfarLabel.font = UIFont(name: "Kefa-Regular", size: 80)
        farfarLabel.textAlignment = .center
        farfarLabel.textColor = .white // Set the text color to white
        farfarLabel.translatesAutoresizingMaskIntoConstraints = false
        sheetView.addSubview(farfarLabel)

        // Set up constraints to position the "FARFAR" label below the "FARMOR" label
        NSLayoutConstraint.activate([
            farfarLabel.leadingAnchor.constraint(equalTo: sheetView.leadingAnchor, constant: 35),
            farfarLabel.topAnchor.constraint(equalTo: farmorLabel.bottomAnchor, constant: -20),
            farfarLabel.widthAnchor.constraint(equalToConstant: 323),
            farfarLabel.heightAnchor.constraint(equalToConstant: 103)
        ])

        // Create a label to display the "OCH JAG" text below the "FARFAR" label
        let ochJagLabel = UILabel()
        ochJagLabel.text = "OCH JAG"
        ochJagLabel.font = UIFont(name: "Kefa-Regular", size: 70)
        ochJagLabel.textAlignment = .center
        ochJagLabel.textColor = .white // Set the text color to white
        ochJagLabel.translatesAutoresizingMaskIntoConstraints = false
        sheetView.addSubview(ochJagLabel)

        // Set up constraints to position the "OCH JAG" label below the "FARFAR" label
        NSLayoutConstraint.activate([
            ochJagLabel.centerXAnchor.constraint(equalTo: sheetView.centerXAnchor),
            ochJagLabel.leadingAnchor.constraint(equalTo: sheetView.leadingAnchor, constant: 56),
            ochJagLabel.topAnchor.constraint(equalTo: farfarLabel.bottomAnchor, constant: -20),
            ochJagLabel.widthAnchor.constraint(equalToConstant: 280),
            ochJagLabel.heightAnchor.constraint(equalToConstant: 144)
        ])

        return sheetView
    }
}

extension Page1ViewController: PageViewControllerDelegate {
    func pageViewControllerDidDismiss() {
        dismiss(animated: true, completion: nil)
    }
}

