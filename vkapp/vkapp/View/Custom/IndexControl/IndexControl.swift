//
//  IndexControl.swift
//  vkapp
//
//  Created by Pavel Lazarev on 25.09.2021.
//

import UIKit

protocol IndexControlItem where Self: UIView {
    var isSelected: Bool { get set }
    var indicator: IndexControlItemIndicator? { get set }
}

class IndexControlItemView: UIView, IndexControlItem {
    
    // MARK: - Public Properties
    public var isSelected: Bool = false {
        didSet {
            self.selectItem(isSelected)
        }
    }
    
    public var indicator: IndexControlItemIndicator?
    
    public var title: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            self.titleLabel.text
        }
    }
    public var titleFont: UIFont {
        set {
            self.titleLabel.font = newValue
        }
        get {
            self.titleLabel.font
        }
    }
    public var titleColor: UIColor {
        set {
            self.titleLabel.textColor = newValue
        }
        get {
            self.titleLabel.textColor
        }
    }
    public var titleSelectedColor: UIColor? {
        set {
            self.titleLabel.highlightedTextColor = newValue
        }
        get {
            self.titleLabel.highlightedTextColor
        }
    }
    
    public var selectedColor: UIColor? {
        set {
            self.selectedView.backgroundColor = newValue
        }
        get {
            self.selectedView.backgroundColor
        }
    }
    
    // MARK: - Private UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .black
        label.highlightedTextColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        return imageView
    }()
    
    private lazy var selectedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()
    
    // MARK: - Setting View
    
    required init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(selectedView)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalTo: self.titleLabel.widthAnchor).isActive = true
        
        self.imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.selectedView.topAnchor.constraint(equalTo: self.titleLabel.topAnchor).isActive = true
        self.selectedView.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
        self.selectedView.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor).isActive = true
        self.selectedView.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
    }
    
    private func selectItem(_ select: Bool) {
        if selectedView.layer.cornerRadius == 0, selectedView.bounds.width > 0 {
            selectedView.layer.cornerRadius = selectedView.bounds.width * 0.5
        }
        titleLabel.isHighlighted = select
        imageView.isHighlighted = select
        selectedView.isHidden = !select
    }
}

class IndexControlItemIndicator: UIView {
    public var titleColor: UIColor = .white {
        didSet { self.titleLabel.textColor = self.titleColor }
    }
    
    public var titleFont: UIFont = .boldSystemFont(ofSize: 35) {
        didSet { self.titleLabel.font = self.titleFont }
    }
    
    public var indicatorBackgroundColor: UIColor = .white {
        didSet { self.shapeLayer.fillColor = self.indicatorBackgroundColor.cgColor }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = bounds
        label.textColor = self.titleColor
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private var shapeLayer: CAShapeLayer!
    
    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.addSubview(self.titleLabel)
        self.titleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.shapeLayer = self.shapeLayerCalc()
        self.layer.addSublayer(self.shapeLayer)
    }
    
    private func shapeLayerCalc() -> CAShapeLayer {
        let x = bounds.width * 0.5
        let y = bounds.height * 0.5
        let radius = bounds.width * 0.5
        let startAngle = CGFloat(Double.pi * 0.25)
        let endAngle = CGFloat(Double.pi * 1.75 )
        
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: x, y: y), radius: radius, startAngle:startAngle, endAngle: endAngle, clockwise: true)
        
        let lineX = x * 2 + bounds.width * 0.2
        let lineY = y
        path.addLine(to: .init(x: lineX, y: lineY))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.fillColor = self.indicatorBackgroundColor.cgColor
        shapeLayer.path = path.cgPath
        return shapeLayer
    }
    
    private override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class IndexControl: UIControl {
    
    // MARK: - UI Elements
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Variables
    public private(set) var isTouching = false
    public private(set) var selectedItem: IndexControlItem?
    
    private var items: [IndexControlItemView] = []
    private var handleAction: ((Int) -> Void)?
    
    
    // MARK: - Setting View
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func setItems(
        from chars: [String],
        handleItem: @escaping (_ item: IndexControlItemView) -> Void
    ) {
        self.items = chars.compactMap { char in
            let item = IndexControlItemView()
            item.title = char
            item.indicator = IndexControlItemIndicator(title: char)
            return item
        }
        
        for item in items {
            handleItem(item)
            self.stackView.addArrangedSubview(item)
        }
        
    }
    
    public func action(_ handler: @escaping (_ section: Int) -> Void) {
        handleAction = handler
    }
    
    public func item(at section: Int) -> (item: IndexControlItem, section: Int)? {
        guard section >= 0, section < self.items.count else { return nil }
        let item = self.items[section]
        item.indicator?.layoutSubviews()
        return (item, section)
    }
    
    // MARK: -  Touches handle
    private func point(_ point: CGPoint, isIn view: UIView) -> Bool {
        return point.y <= (view.frame.origin.y + view.frame.size.height) && point.y >= view.frame.origin.y
    }
    
    private func getSectionBy(_ touches: Set<UITouch>) -> Int? {
        guard let touch = touches.first else { return nil }
        let p = touch.location(in: self)
        return self.items.enumerated().filter {
            self.point(p, isIn: $0.element)
        }.compactMap { $0.offset }.first
    }
    
    private func touchesOccurred(_ touches: Set<UITouch>) {
        self.isTouching = true
        guard let section = self.getSectionBy(touches) else { return }
        guard let item = self.item(at: section), !(self.selectedItem?.isEqual(item) ?? false) else { return }
        self.handleAction?(item.section)
    }
    
    private func touchesEnded() {
        self.isTouching = false
    }
    
    
    // MARK: - UIView TouchesEvent
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesOccurred(touches)
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesOccurred(touches)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded()
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded()
    }
}
