//
//  AKLog.swift
//  AudioKit
//
//  Created by Aurelius Prochazka on 9/14/15.
//  Copyright © 2015 AudioKit. All rights reserved.
//

import Foundation

/** Log of the input signal.
*/
@objc class AKLog : AKParameter {
    
    // MARK: - Properties
    
    /** Input to the mathematical function */
    private var input = AKParameter()
    
    // MARK: - Initializers
    
    /** Instantiates the log
    
    - parameter input: Input signal.
    */
    init(_ input: AKParameter)
    {
        super.init()
        self.input = input
        dependencies = [input]
    }
    
    /** Computation of the next value */
    override func compute() {
        leftOutput  = log(input.leftOutput)
        rightOutput = log(input.rightOutput)
    }
}

/** Natural log helper function */
func log(parameter: AKParameter) -> AKLog {
    return AKLog(parameter)
}