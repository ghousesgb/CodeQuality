# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

def available_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'CodeQuality' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for KYGInsurance
    available_pods

    target 'CodeQualityTests' do
    	 inherit! :search_paths
    end
end
