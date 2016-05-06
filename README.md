# ${UAC Avoider}

	Allows any file to be run as admin (if you have permissions) without prompting UAC.

## How it works

	Takes in a file, generates a unique identifier and configures a scheduled task to be run as 'highest privileges'
	Shortcut runs the task, which avoids the UAC prompt

## Installation
	Just run the code in PowerShell, ISE or run the .exe


## Usage

### Creating a shortcut

	Run
	Select a file (Hint: Use the base exe of the file, NOT another shortcut!)
	Select a save location
	Go!

### Removing a shortcut
	
	'Careful - This will remove normal shortcuts aswell'
	Run
	Select Shortcut 
	Go!

## Example
	Example showing difference using the app itself
![Alt text](http://puu.sh/oImha/fc7cdfffe3.png)

## Contributing

	1. Fork it!
	2. Create your feature branch: `git checkout -b my-new-feature`
	3. Commit your changes: `git commit -am 'Add some feature'`
	4. Push to the branch: `git push origin my-new-feature`
	5. Submit a pull request :D

## Credits
	Connor Unsworth
## License
	Use according to MIT license
