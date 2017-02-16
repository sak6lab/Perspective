//
//  Frequency.swift
//  Perspective
//
//  Created by Saketh D on 2/6/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

class Frequency{
    private var _businessFreq: Int?
    private var _entertainmentFreq: Int?
    private var _gamingFreq: Int?
    private var _generalFreq: Int?
    private var _musicFreq: Int?
    private var _scienceAndNatureFreq: Int?
    private var _sportFreq: Int?
    private var _technologyFreq: Int?
    
    var businessFreq: Int{
        get{
            if _businessFreq != nil{
                return _businessFreq!
            }
            return 0
        }
        set{
            _businessFreq = newValue
        }
    }
    var entertainmentFreq: Int{
        get{
            if _entertainmentFreq != nil{
                return _entertainmentFreq!
            }
            return 0
        }
        set{
            _entertainmentFreq = newValue
        }
    }
    var gamingFreq: Int{
        get{
            if _gamingFreq != nil {
                return _gamingFreq!
            }
            return 0
        }
        set{
            _gamingFreq = newValue
        }
    }
    var generalFreq:Int{
        get{
            if _generalFreq != nil {
                return  _generalFreq!
            }
            return 0
        }
        set{
            _generalFreq = newValue
        }
    }
    var musicFreq: Int{
        get{
            if _musicFreq != nil {
                return _musicFreq!
            }
            return 0
        }
        set{
            _musicFreq = newValue
        }
    }
    var scienceAndNatureFreq: Int{
        get{
            if _scienceAndNatureFreq != nil {
                return _scienceAndNatureFreq!
            }
            return 0
        }
        set{
            _scienceAndNatureFreq = newValue
        }
    }
    var sportFreq: Int{
        get{
            if _sportFreq != nil{
                return _sportFreq!
            }
            return 0
        }
        set{
            _sportFreq = newValue
        }
    }
    var technologyFreq: Int{
        get{
            if _technologyFreq != nil {
                return _technologyFreq!
            }
            return 0
        }
        set{
            _technologyFreq = newValue
        }
    }
    var total: Int{
        get{
            return businessFreq + entertainmentFreq + gamingFreq + generalFreq + musicFreq + scienceAndNatureFreq + sportFreq + technologyFreq
        }
    }
    
    func perCategory(cat: categories) -> Int{
        if cat == categories.Business{
            return businessFreq
        } else if cat == categories.Entertainment{
            return entertainmentFreq
        } else if cat == categories.Gaming{
            return gamingFreq
        } else if cat == categories.General{
            return generalFreq
        } else if cat == categories.Music{
            return musicFreq
        } else if cat == categories.ScienceAndNature{
            return scienceAndNatureFreq
        } else if cat == categories.Sport{
            return sportFreq
        } else {
            return technologyFreq
        }
    }
    
    func ratio(cat: categories) -> Double {
        let category = perCategory(cat: cat)
        let tot = total
        if tot == 0 {
            return 0
        }
        let result = Double(category)/Double(tot)
        return result
    }
}
