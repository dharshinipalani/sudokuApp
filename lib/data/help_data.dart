List<Map<String, List<String>>> level = [
  {
    'EASY': [
      'Suitable for beginners or those looking for a relaxed Sudoku challenge.',
      'Provides a gentle introduction to Sudoku rules and logical reasoning.',
      'Solvable with basic techniques, making it accessible to a wide range of players.',
    ]
  },
  {
    'MEDIUM': [
      'Offers a balanced challenge for players with some Sudoku experience.',
      'Requires a combination of basic strategies and more advanced logical thinking.',
      'Strikes a middle ground between simplicity and complexity.'
    ]
  },
  {
    'HARD': [
      'Geared towards experienced Sudoku players seeking a substantial challenge.'
          'Involves complex logical patterns and demands a deep understanding of Sudoku strategies.'
          'Solving hard puzzles may take more time and strategic thinking.'
    ]
  }
];
const List<Map<String, List<String>>> instructions = [
  {
    'Understand the Grid': [
      'The Sudoku grid consists of 9 columns, 9 rows, and 9 boxes (3x3 subgrids)',
      'Initially, some numbers are provided in certain cells',
    ],
  },
  {
    'Fill in the Numbers': [
      'Start by examining the provided numbers and identifying which numbers are already placed in certain rows, columns, or boxes',
    ],
  },
  {
    'Apply the Rules': [
      'Based on the rules, begin filling in the remaining empty cells one by one',
      'Ensure that each number from 1 to 9 is placed in each row, column, and box without repetition',
    ]
  },
  {
    'Trial and Error': [
      'If you get stuck, you can use trial and error by placing numbers in certain cells and seeing if it leads to a solution',
      'If it doesn\'t work, you can backtrack',
    ]
  },
  {
    'Double-Check': [
      'Once you think you have completed the puzzle, double-check your work to ensure that all the rules are followed'
    ]
  }
];
const List<String> rules = [
  'Each row must contain the numbers 1 through 9 with no repetition.',
  'Each column must contain the numbers 1 through 9 with no repetition.',
  'Each of the nine 3x3 subgrids must contain the numbers 1 through 9 with no repetition.',
  'The puzzle starts with some cells pre-filled with numbers. Your goal is to fill in the remaining cells.',
];
