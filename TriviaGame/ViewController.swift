
import UIKit

class ViewController: UIViewController {


    @IBOutlet var textDes: UITextView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var MyIndex: UILabel!
    @IBOutlet var MyHearts: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    var randomNumbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    var myUrl = ""
    var startOver = true
    var time = 2.0
    
    
    
    //let progress = Progress(totalUnitCount: 15)
    
    var data = DataLoader().userData
    var index = 0, counter = 0, hearts = 3
    var progress = 0.0
    
    @IBAction func btn1Action(_ sender: Any) {
        
        print("btn1 pressed")
        if(!startOver){
        if(data[index].correct == 1){
            btn1.tintColor = UIColor.green
            counter += 1
        }
        else{
            btn1.tintColor = UIColor.red
            showAns()
            hearts -= 1
        }
        index += 1
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        
            if(self.index <= 15){
                self.startGame()
            }
            else{
                
            }
        }
        }else{
            startOver = false
            index = 0
            counter = 0
            hearts = 3
            self.btn2.isHidden = false
            self.btn3.isHidden = false
            self.btn4.isHidden = false
            self.btn1.tintColor = UIColor.white
            progress = 0.0
            self.progressBar.setProgress(Float(progress), animated: false)
            self.textDes.textColor = UIColor.white
            startGame()
        }
    }
    
    @IBAction func btn2Action(_ sender: Any) {
        
        print("btn2 pressed")
        if(data[index].correct == 2){
            btn2.tintColor = UIColor.green
            counter += 1
        }
        else{
            btn2.tintColor = UIColor.red
            showAns()
            hearts -= 1
        }
        index += 1
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        
            if(self.index <= 15){
                self.startGame()
            }
            else{
                
            }
        }
    }
    
    @IBAction func btn3Action(_ sender: Any) {
        
        print("btn3 pressed")
        if(data[index].correct == 3){
            btn3.tintColor = UIColor.green
            counter += 1
        }
        else{
            btn3.tintColor = UIColor.red
            showAns()
            hearts -= 1
        }
        index += 1
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        
            if(self.index <= 15){
                self.startGame()
            }
            else{
                
            }
        }
    }
    
    @IBAction func btn4Action(_ sender: Any) {
        
        print("btn4 pressed")
        if(data[index].correct == 4){
            btn4.tintColor = UIColor.green
            counter += 1
        }
        else{
            btn4.tintColor = UIColor.red
            showAns()
            hearts -= 1
        }
        index += 1
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        
            if(self.index <= 15){
                self.startGame()
            }
            else{
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.shuffle()
        newGame()
        
        
        
    }
    
    func newGame(){
        
        btn2.isHidden = true
        btn3.isHidden = true
        btn4.isHidden = true
        btn1.setTitle("Start Game", for: .normal)
        btn1.tintColor = UIColor.systemGreen


    }
    
    func startGame(){
        
        if (hearts > 0){
            if (index <= 14){
                myUrl = data[index].image
                fetchImage()
                self.progress = progress + 0.065
                self.progressBar.setProgress(Float(progress), animated: false)
                MyIndex.text = String(counter)
                MyHearts.text = String(hearts)
                btn1.tintColor = UIColor.white
                btn2.tintColor = UIColor.white
                btn3.tintColor = UIColor.white
                btn4.tintColor = UIColor.white
                textDes.text = data[index].qustion
                btn1.setTitle(data[index].answer1, for: .normal)
                btn2.setTitle(data[index].answer2, for: .normal)
                btn3.setTitle(data[index].answer3, for: .normal)
                btn4.setTitle(data[index].answer4, for: .normal)
            } else {
                winning()
            }
        }else {
            loseing()
        }
    }
    
    func showAns(){
        if(data[index].correct == 1){
            btn1.tintColor = UIColor.green
        }
        if(data[index].correct == 2){
            btn2.tintColor = UIColor.green
        }
        if(data[index].correct == 3){
            btn3.tintColor = UIColor.green
        }
        if(data[index].correct == 4){
            btn4.tintColor = UIColor.green
        }
        
    }
    
    func fetchImage(){
        guard let urll = URL(string: myUrl) else {
            return
        }
        let getDataTask = URLSession.shared.dataTask(with: urll) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        getDataTask.resume()
    }
    
    func winning(){
        MyIndex.text = String(counter)
        imageView.image = UIImage(named: "winner")
        textDes.text = "You win the Trivia game\nWith Score of " + String(counter) + " From 15 questions"
        textDes.textColor = UIColor.green
        self.progressBar.setProgress(Float(1.0), animated: false)
        startOver = true
        newGame()
        
    }
    
    func loseing(){
        MyHearts.text = String(hearts)
        imageView.image = UIImage(named: "lose")
        textDes.text = "You lost the Trivia game\nWith Score of " + String(counter) + " From 15 questions"
        textDes.textColor = UIColor.red
        startOver = true
        newGame()
        
    }
}
