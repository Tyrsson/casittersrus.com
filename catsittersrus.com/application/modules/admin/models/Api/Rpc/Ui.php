<?php
/**
 *
 * @author Joey Smith
 *
 */
class Admin_Model_Api_Rpc_Ui
{
    /**
     * Return sum of two variables
     *
     * @param  int $x
     * @param  int $y
     * @return int
     */
    public function add($x, $y)
    {
        return $x + $y;
    }

    /**
     * Return difference of two variables
     *
     * @param  int $x
     * @param  int $y
     * @return int
     */
    public function subtract($x, $y)
    {
        return $x - $y;
    }

    /**
     * Return product of two variables
     *
     * @param  int $x
     * @param  int $y
     * @return int
     */
    public function multiply($x, $y)
    {
        return $x * $y;
    }

    /**
     * Return the division of two variables
     *
     * @param  int $x
     * @param  int $y
     * @return float
     */
    public function divide($x, $y)
    {
        return $x / $y;
    }
}