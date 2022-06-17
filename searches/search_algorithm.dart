/**
 * The common interface of most searching algorithms
 *
 * @author Podshivalov Nikita (https://github.com/nikitap492)
 */
class SearchAlgorithm {

    /**
     * @param key is an element which should be found
     * @param array is an array where the element should be found
     * @param <T> Comparable type
     * @return first found index of the element
     */
     int? find<T extends Comparable<T>>(List<T> array, T key){
       return null;
     }
}